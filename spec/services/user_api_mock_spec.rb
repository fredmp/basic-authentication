require 'rails_helper'

RSpec.describe UserApiMock do

  describe "#authenticate" do

    it "returns a valid user if email and password are considered valid" do
      response = subject.authenticate("valid@email.com", "0123456789")

      expect(response[:code]).to eq(200)
      expect(response[:user][:id]).to be_a(Numeric)
      expect(response[:user][:email]).to eq("valid@email.com")
      expect(response[:message]).to eq("Successfully authenticated as valid@email.com")
    end

    it "fails if password is equal to the word password" do
      response = subject.authenticate("valid@email.com", "password")

      expect(response[:code]).to eq(401)
      expect(response[:message]).to eq("Invalid email or password")
    end

  end

end
