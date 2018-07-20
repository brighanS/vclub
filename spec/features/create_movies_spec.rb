require 'rails_helper'
require 'support/capybara'

RSpec.feature "CreateMovies", type: :feature do
  describe "Movie creation process", :type => :feature do

    let(:user){create :user}
    let(:movie){create :movie}

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
          expect(page).to have_selector(:link_or_button, 'Create Movie')
      end
    end

    context 'when valid movie data is provided' do
      it "saves movie" do
        login_as user
        # visit '/movies/new'
        # fill_form(:movie,{
        #   movie_name: movie.name,
        #   movie_genre: movie.genre,
        #   movie_image_url: movie.image_url,
        #   movie_price: movie.price,
        #   movie_duration: movie.duration
        #   })
        #   click_on submit(:movie)
        visit '/movies/new'
          fill_in 'movie[name]', with: "los increibles"
          fill_in 'movie[genre]', with: movie.genre
          fill_in 'movie_image_url', with: movie.image_url
          fill_in 'movie_price', with: movie.price
          fill_in 'movie_duration', with: movie.duration
          save_and_open_page
        #click_link 'input[name="commit"]'

        click_button("Create Movie")
        expect(page).to have_content 'Movie was successfully created.'
        #expect(page).to have_selector(:link_or_button, 'Send')
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
