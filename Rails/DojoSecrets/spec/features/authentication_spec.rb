require 'rails_helper'

feature 'authentication feature' do

  before do
#    User.all.each { |u| u.destroy }
    @user = create(:user)
  end

  feature 'user attempts to sign in' do
    scenario 'visits sign-in page, prompted with email and password fields' do
      visit '/sessions/new'
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
    end

    scenario 'logs in user if email/password combination is valid' do
      log_in
      expect(current_path).to eq("/users/show/#{@user.id}")
    end 

    scenario 'does not sign in user if email is not found' do
      log_in(email: "fake@gmail.com")
      expect(page).to have_current_path("/sessions/new")
    end

    scenario 'does not sign in user if email/password combination is invalid' do
      log_in(password: "Wrongpassword")
      expect(page).to have_current_path("/sessions/new")
    end
  end

  feature 'user attempts to log out' do
    before do
      log_in
    end
    scenario 'displays "Log out" button when user is logged on' do
      expect(page).to have_button("Log out")
    end

    scenario 'logs out user and redirects to login page' do
      click_button 'Log out'
      expect(page).to have_current_path("/sessions/new")
    end

  end
end
