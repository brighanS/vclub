require 'rails_helper'

RSpec.feature "SignUpPages", type: :feature do
  describe "Sign Up page behavior", :type => :feature do

    let(:user){build :user}

    context 'when sign_up page is presented' do
      it "displays all its content" do
        visit '/users/sign_up'
          expect(page).to have_content 'Sign Up'
        within(".nav") do
          expect(page).to have_selector(:link_or_button, 'Log In')
          expect(page).to have_selector(:link_or_button, 'Sign Up!')
        end
        within('#sign_up_form') do
          expect(page).to have_content 'Email'
          expect(page).to have_content 'Password'
          expect(page).to have_content 'Password confirmation'
        end
      end
    end

    context 'when sign_up is clicked with empty form' do
      it "throws an error" do
        visit '/users/sign_up'
        within("#sign_up_form") do
          click_button('Sign Up!')
        end
        within("#error_explanation") do
            expect(page).to have_content '2 errors prohibited this user from being saved:'
        end
      end
    end

    context 'when valid data is provided' do
      it "saves user and login is allowed" do
        visit '/users/sign_up'
        within("#sign_up_form") do
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          fill_in 'user_password_confirmation', with: user.password
          click_button('Sign Up!')
        end
          expect(page).to have_content 'Welcome! You have signed up successfully.'
          expect(page).to have_content user.email
      end
    end

    context 'when the Log in link is clicked' do
      it "displays the login form" do
        visit '/users/sign_up'
        within("#sign_up_form") do
          click_link 'Log in'
        end
        expect(page).to have_content 'Log in'
      end
    end

  end
end
