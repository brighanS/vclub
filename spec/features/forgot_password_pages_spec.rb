require 'rails_helper'

RSpec.feature "ForgotPasswordPages", type: :feature do
  describe "Forgot Password page behavior", :type => :feature do

    context 'when forgot_password page is presented' do
      it "displays all its content" do
        visit '/users/password/new'
          expect(page).to have_content 'Forgot your password?'
        within(".nav") do
          expect(page).to have_selector(:link_or_button, 'Log In')
          expect(page).to have_selector(:link_or_button, 'Sign Up!')
        end
        within('#forgot_password') do
          expect(page).to have_content 'Email'
          expect(page).to have_selector(:link_or_button, 'Send me reset password instructions')
        end
        expect(page).to have_selector(:link_or_button, 'Log in')
        expect(page).to have_selector(:link_or_button, 'Sign up')
      end
    end

    context 'when forgot_password button is clicked with empty form' do
      it "throws an error" do
        visit '/users/password/new'
        within("#forgot_password") do
          click_button('Send me reset password instructions')
        end
        within("#error_explanation") do
            expect(page).to have_content '1 error prohibited this user from being saved:'
        end
      end
    end
    #

    context 'when unregistered email is provided' do
      it "throws and error" do
        visit '/users/password/new'
        within("#forgot_password") do
          fill_in 'user_email', with: 'unregistered@email.com'
          click_button('Send me reset password instructions')
        end
        within("#error_explanation") do
            expect(page).to have_content '1 error prohibited this user from being saved:'
            expect(page).to have_content 'Email not found'
        end
      end
    end

    context 'when valid email is provided' do
      it "sends instructions email" do
        user = User.last
        visit '/users/password/new'
        within("#forgot_password") do
          fill_in 'user_email', with: user.email
          click_button('Send me reset password instructions')
        end
        expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
        expect(page).to have_content 'Log in'
      end
    end
  end
end
