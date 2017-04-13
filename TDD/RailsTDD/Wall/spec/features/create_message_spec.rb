=begin

    Create a Message Tests

=end

require 'rails_helper'

feature 'registered user creates a message' do

  before(:each) do
    visit messages_new_path

    @message = "This is a valid message"
    @create_message = "Create Message"

    fill_in "message_message", with: @message

  end

  scenario 'successfully creates a new message' do

    click_button "Create Message"

    expect(page).to have_content "Successfully created message"
  end

  scenario 'unsuccessfully create a message with invalid message field' do

    invalid_messages = ["", "123456789"]

    invalid_messages.each do |message|
      visit messages_new_path
      fill_in "message_message", with: message
      click_button @create_message
      expect(page).to have_content "Unsuccessfully created message"
    end

  end

end
