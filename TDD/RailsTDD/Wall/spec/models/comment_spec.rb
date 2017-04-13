require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.first
    @commenter = User.last
    @message = create(:message, user: @user)
  end

  it 'will not save with a comment length less than 10' do
    expect(build(:comment, comment: "", user: @commenter, message: @message)).to be_invalid
    expect(build(:comment, comment: "123456789", user: @commenter, message: @message)).to be_invalid
    expect(build(:comment, comment: "asdf0123456789", user: @commenter, message: @message)).to be_valid
  end

  it 'will not save without a user' do
    expect(build(:comment, comment: "This is a valid comment", user: @commenter)).to be_invalid
  end

  it 'will not save without a message' do
    expect(build(:comment, comment: "This is a valid comment", message: @message)).to be_invalid
  end

end
