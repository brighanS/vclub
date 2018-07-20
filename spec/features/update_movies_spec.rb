require 'rails_helper'

RSpec.feature "UpdateMovies", type: :feature do
  describe "Update movie process when movies exists", :type => :feature do

    let(:user){create :user}
    let!(:movie){create :movie}

    context 'when logged_in the movies page' do
      it "displays edit button" do
        login_as user
        visit '/'
        expect(page).to have_selector(:link_or_button, 'Edit')
      end
    end

    context 'when Edit is clicked' do
      it "displays the update mpovie form " do
        login_as user
        visit '/'
        click_link('Edit')
        expect(page).to have_content 'Editing Movie'
        within('.form-group') do
          expect(page).to have_content 'Name'
          expect(page).to have_content 'Genre'
          expect(page).to have_content 'Image url'
          expect(page).to have_content 'Price'
          expect(page).to have_content 'Duration'
        end
          expect(page).to have_selector(:link_or_button, 'Update Movie')
      end
    end

    context 'when valid movie data is provided' do
      it "updates movie data" do
        login_as user
        visit '/'
        click_link('Edit')
        expect(page).to have_content 'Editing Movie'
          fill_in 'movie[name]', with: movie.name
          fill_in 'movie[genre]', with: movie.genre
          fill_in 'movie[image_url]', with: movie.image_url
          fill_in 'movie[price]', with: movie.price
          fill_in 'movie[duration]', with: movie.duration
          click_button('Update Movie')
          expect(page).to have_content('Movie was successfully updated.')
          expect(page).to have_content movie.name
      end
    end

  end
end
