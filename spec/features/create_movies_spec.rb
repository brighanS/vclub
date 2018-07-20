require 'rails_helper'
require 'support/capybara'

RSpec.feature "CreateMovies", type: :feature do
  describe "Movie creation process", :type => :feature do

    let(:user){create :user}
    let!(:movie){build :movie}

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
        visit '/movies/new'
          fill_in 'movie[name]', with: movie.name
          fill_in 'movie[genre]', with: movie.genre
          fill_in 'movie[image_url]', with: movie.image_url
          fill_in 'movie[price]', with: movie.price
          fill_in 'movie[duration]', with: movie.duration
          click_button('Create Movie')
          expect(page).to have_content('Movie was successfully created.')
          expect(page).to have_content movie.name
      end
    end

  end
end
