require 'rails_helper'

RSpec.describe User, type: :model do

  context 'valid attributes' do
    it 'will save' do
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )

      expect(user).to be_valid
    end
  end

  context 'invalid attributes' do
    it 'will not save a user with blank first_name' do
      user = User.new(
        first_name: '',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )

      expect(user).to be_invalid
    end

    it 'will not save a user with blank last_name' do
      user = User.new(
        first_name: 'shane',
        last_name: '',
        email: 'schang@codingdojo.com'
      )

      expect(user).to be_invalid
    end

    it 'will not save save user with duplicate email' do
      dup_email = 'schang@codingdojo.com'

      User.create(
        first_name: 'shane',
        last_name: 'chang',
        email: dup_email
      )

      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: dup_email
      )
      expect(user).to be_invalid
    end

    it 'will not save user with invalid email format' do
      invalid_emails = ['schangcodingdojo.com', 'schang@codingdojocom', 'schangcodingdojocom']

      user = User.new(
        first_name: 'shane',
        last_name: 'change',
        email: ''
      )

      invalid_emails.each do |e|
        user.email = e
        expect(user).to be_invalid
      end
    end

  end




end
