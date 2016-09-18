class SessionsController < ApplicationController

  def new
  end

  def create
    api_response = UserApiMock.new.authenticate(allowed_params[:email], allowed_params[:password])

    if api_response[:success]
      session[:user_id] = api_response[:user][:id]
      redirect_to root_path, notice: api_response[:message]
    else
      redirect_to root_path, alert: api_response[:message]
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: I18n.t(:logout_message)
  end

  private

  def allowed_params
    params.require(:session).permit([:email, :password])
  end

end
