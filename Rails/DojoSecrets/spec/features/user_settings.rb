require 'rails_helper'
feature 'User features ' do
  feature "User Settings Dashboard" do
    before do
      @user = create(:user)
      log_in
    end

    before(:each) do
      puts @user.id
      visit "/users/#{@user.id}/edit"
    end

    scenario "visit users edit page" do 
      expect(page).to have_field("Name") 
      expect(page).to have_field("Email") 
    end

    scenario "inputs filled out correctly" do
      expect(page).to have_field("Name", with: @user.name) 
      expect(page).to have_field("Email", with: @user.email) 
    end

    scenario "incorrectly updates information" do
      fill_in "Name", with: "A Different Name"
      fill_in "Email", with: "Incorrect Email"
      click_button "Update"
      expect(page).to have_content("Email is invalid")
    end

    scenario "correctly updates information" do
      fill_in "Name", with: "Candy Corn Corey"
      fill_in "Email", with: "ccc@gmail.com"
      click_button "Update"
      expect(current_path).to eq("/users/#{@user.id}/show")
      expect(page).to have_text("Candy Corn Corey")
      expect(page).to have_text("ccc@gmail.com")
    end

    scenario "destroys user and redirects to registration page" do
      click_button "Delete User"
      expect(current_path).to eq("/users/new")
    end

  end
end
