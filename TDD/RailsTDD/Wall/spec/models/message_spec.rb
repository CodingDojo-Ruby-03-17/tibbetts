require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    User.all.each { |u| u.destroy }
  end

  it 'will not save with a message length less than 10' do
    user = create(:user)
    expect(build(:message, user: user, message: "")).to be_invalid
    expect(build(:message, user: user, message: "123456789")).to be_invalid
    expect(build(:message, user: user, message: "0123456789")).to be_valid
  end

  it 'will not save without a user' do
    expect(build(:message)).to be_invalid
  end

end
