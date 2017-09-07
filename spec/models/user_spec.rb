require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do

      expect(User.new({
        name: 'kyle',
        email: 'kyle.w.r@hotmail.com',
        password: '351797asd'
      })).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(password: nil)
      expect(user).to_not be_valid
    end
  end
end
