require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#email" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value("invalid").for(:email) }
    it { should allow_value("valid@email.com").for(:email) }
  end

  describe "#password" do
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should have_secure_password }
  end

end
