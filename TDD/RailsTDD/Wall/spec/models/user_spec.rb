require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.all.each { |u| u.destroy }
  end 

  context 'with valid attributes' do
    it 'will save' do 
      expect(build(:user)).to be_valid
    end
  end

  context 'with invalid attributes' do 
    it 'will not save without first name' do    
      expect(build(:user, :no_firstname)).to be_invalid
    end  

    it 'will not save with a username length less than 5 characters' do
      expect(build(:user, username: "")).to be_invalid
      expect(build(:user, username: "asdf")).to be_invalid
      expect(build(:user, username: "asdfa")).to be_valid
    end

    it 'will not save with a duplicate username' do
      create(:user)
      expect(build(:user, email: "qwertyasdf@mail.com")).to be_invalid
    end

    it 'will not save with a password length less than 8 characters' do
      expect(build(:user, password: "")).to be_invalid
      expect(build(:user, password: "short")).to be_invalid
    end

    it 'will not save with a password length greater than 22 characters' do
      expect(build(:user, password: "this password is too long")).to be_invalid
    end

    it 'will not save with a duplicate email' do
      create(:user)   
      expect(build(:user, username: "betts")).to be_invalid
    end

    it 'will not save with an incorrect formatted email' do
      expect(build(:user, email: "asdfmail.com")).to be_invalid
      expect(build(:user, email: "asdf@mailcom")).to be_invalid
      expect(build(:user, email: "asdfmailcom")).to be_invalid
    end
  end

end
