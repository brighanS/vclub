require 'rails_helper'

describe "Login page behaviour ", :type => :feature do

  let(:user){create :user}

  context 'registered user attempts to log in' do
    it "allows user to login" do
      visit '/users/sign_in'
      within("#sessions") do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_button('Log in')
      end
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context 'unregistered user attempts to log in' do
    it "denies user to login" do
      visit '/users/sign_in'
      within("#sessions") do
        fill_in 'user_email', with: 'notRegistered@user.com'
        fill_in 'user_password', with: '258258'
        click_button('Log in')
      end
      expect(page).to have_content 'Log in'
    end
  end

  context 'when the sign_up link is clicked' do
    it "displays the sign_up form" do
      visit '/users/sign_in'
      within("#sessions") do
        click_link 'Sign up'
      end
      expect(page).to have_content 'Sign Up'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Password confirmation'
    end
  end

  context 'when the Forgot your password? link is clicked' do
    it "displays the forgot password form" do
      visit '/users/sign_in'
      within("#sessions") do
        click_link 'Forgot your password?'
      end
      expect(page).to have_content 'Forgot your password?'
      expect(page).to have_content 'Email'
      expect(page).to have_selector(:link_or_button, 'Send me reset password instructions')
      expect(page).to have_selector(:link_or_button, 'Send me reset password instructions')
    end
  end

end #final END
