require 'rails_helper'
feature "guest user creates an account" do

  scenario "successfully creates a new user account" do
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "chang"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "User successfully created"
  end

  scenario "unsuccessfully creates a new user account" do 
    visit new_user_path
    click_button "Create User"
    expect(current_path).to eq(new_user_path)
  end

  scenario "doesn't fill out first name field" do 
    visit new_user_path
    fill_in "user_last_name", with: "chang"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "First Name can't be blank"
  end

  scenario "doesn't fill out last name field" do 
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_email", with: "schange@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "Last Name can't be blank"
  end

  scenario "doesn't fill out email field" do 
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "chang"
    click_button "Create User"
    expect(page).to have_content "Email can't be blank"
  end
end
