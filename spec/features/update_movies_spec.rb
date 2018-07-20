require 'rails_helper'

RSpec.feature "UpdateMovies", type: :feature do
  describe "Update movie process when movies exists", :type => :feature do

    let(:user){create :user}
    let(:movie){build :movie}

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
end
