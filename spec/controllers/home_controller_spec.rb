require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  before { allow(controller).to receive(:current_user) { user } }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
