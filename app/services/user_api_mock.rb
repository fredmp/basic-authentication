class UserApiMock

  def authenticate(email, password)
    unless password == "password"
      begin
        user = User.where(email: email).first_or_initialize

        if user.new_record?
          user.password = password
          user.password_confirmation = password
          user.save
        end

        return successful_response_for(user) if user.persisted? && user.authenticate(password)

      rescue exception
        failure_response(500, I18n.t("authentication.exception"))
        logger.error(exception.message)
      end
    end

    failure_response(401, message = I18n.t("authentication.invalid"))
  end

  private

  def failure_response(code, message)
    {
      success: false,
      code: code,
      message: message
    }
  end

  def successful_response_for(user)
    {
      success: true,
      code: 200,
      message: I18n.t("authentication.success", email: user.email),
      user: {id: user.id, email: user.email}
    }
  end

end
