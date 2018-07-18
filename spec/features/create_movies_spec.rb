require 'rails_helper'

RSpec.feature "CreateMovies", type: :feature do
  describe "Movie creation process", :type => :feature do

    let(:user){create :user}
    let(:movie){build :movie}

    context 'when logged_in movies page is presented' do
      it "displays new_movie button" do
        login_as user
        visit '/'
        expect(page).to have_selector(:link_or_button, 'New Movie')
      end
    end

    context 'when New Movie is clicked' do
      it "displays the new_movie form " do
        login_as user
        visit '/'
        click_link('New Movie')
        expect(page).to have_content 'New Movie'
        within('.form-group') do
          expect(page).to have_content 'Name'
          expect(page).to have_content 'Genre'
          expect(page).to have_content 'Image url'
          expect(page).to have_content 'Price'
          expect(page).to have_content 'Duration'
        end
      end
    end

    context 'when valid movie data is provided' do
      it "saves movie" do
        login_as user
        visit '/movies/new'
        # within('.form-group') do
          fill_in 'movie_name', with: movie.name
          fill_in 'movie_genre', with: movie.genre
          fill_in 'movie_image_url', with: movie.image_url
          fill_in 'movie_price', with: movie.price
          fill_in 'movie_duration', with: movie.duration
          # fill_in 'movie_name', with: "movie"
          # fill_in 'movie_genre', with: "comedy"
          # fill_in 'movie_image_url', with: "image.jpg"
          # fill_in 'movie_price', with: "60.0"
          # fill_in 'movie_duration', with: "120"
        # end
        within('.actions') do
          click_button 'Send'
        end
        #expect(page).to have_content movie.name
        expect(page).to have_content 'Movie was successfully created.'

      end
    end

    # context 'when valid data is provided' do
    #   it "saves user and login is allowed" do
    #     visit '/users/sign_up'
    #     within("#sign_up_form") do
    #       fill_in 'user_email', with: user.email
    #       fill_in 'user_password', with: user.password
    #       fill_in 'user_password_confirmation', with: user.password
    #       click_button('Sign Up!')
    #     end
    #       expect(page).to have_content 'Welcome! You have signed up successfully.'
    #       expect(page).to have_content user.email
    #   end
    # end
    #
    # context 'when the Log in link is clicked' do
    #   it "displays the login form" do
    #     visit '/users/sign_up'
    #     within("#sign_up_form") do
    #       click_link 'Log in'
    #     end
    #     expect(page).to have_content 'Log in'
    #   end
    # end

  end
end
