=begin

    Create a new User Tests

=end

require 'rails_helper'

feature 'guest user creates an account' do

  before(:each) do 
    # go to register page
    visit users_new_url 

    # make forms data accessible
    @first_name =  "Bob"
    @last_name  =  "Ross"
    @username   =  "bossross"
    @email      =  "bross@gmail.com"
    @password   =  "secretpassword"
    @register_button = "Register User"

    # fill out wit successfuly data
    fill_in "user_first_name", with: @first_name
    fill_in "user_last_name", with: @last_name
    fill_in "user_username", with: @username
    fill_in "user_email", with: @email
    fill_in "user_password", with: @password
  end

  scenario 'successfully created an account' do
    click_button @register_button
    expect(page).to have_current_path('/messages') 
    expect(page).to have_content("Welcome #{@first_name}")
  end  

  scenario 'unsuccessfull: username duplicate' do
    click_button @register_button
    visit users_new_url 

    # change email to avoid duplicate
    fill_in "user_first_name", with: @first_name
    fill_in "user_email", with: "b@m.com"
    fill_in "user_last_name", with: @last_name
    fill_in "user_password", with: @password
    fill_in "user_username", with: @username
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("Username is taken")   
  end

  scenario 'unsuccessfull: username is less than 5 characters' do
    fill_in "user_username", with: "1234"
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Username must be at least 5 characters long')
  end

  scenario 'unsuccessfull: email improper format' do
    fill_in "user_email", with: "fake_email.com"
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Email syntax is incorrect')
  end

  scenario 'unsuccessfull: email duplicate' do
    click_button @register_button
    visit users_new_url 

    # change username to avoid duplicate
    fill_in "user_email", with: @email
    fill_in "user_password", with: @password
    fill_in "user_username", with: "different"
    fill_in "user_last_name", with: @last_name
    fill_in "user_first_name", with: @first_name
    click_button @register_button


    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Email is taken')
  end

  scenario 'unsuccessfull: first_name is less than 2 characters' do
    fill_in "user_first_name", with: "B"
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('First name must be at least 2 characters')
  end

  scenario 'unsuccessfull: password is less than 8 characters' do
    fill_in "user_password", with: "short"
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Password must be between 8-22 characters')
  end

  scenario 'unsuccessfull: password is greater than 22 chracters' do
    fill_in "user_password", with: "this is a password that is too long"
    click_button @register_button

    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Password must be between 8-22 characters')
  end

end

