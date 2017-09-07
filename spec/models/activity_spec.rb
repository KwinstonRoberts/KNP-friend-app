require 'rails_helper'

RSpec.describe Activity, type: :model do
  user = User.create({
    name: 'kyle',
    email: 'kyle.w.r@hotmail.com',
    password: '351797asd',
    personality:nil
  })

  it "is not valid without a name" do
    activity = user.activities.create(name: nil)
    expect(activity).to_not be_valid
  end
end
