require 'rails_helper'

RSpec.feature "DeleteMovies", type: :feature do
  describe "Delete movie process when movies exists", :type => :feature do

    let(:user){create :user}
    let!(:movie){create :movie}

    context 'when logged_in the movies page' do
      it "displays Delete button" do
        login_as user
        visit '/'
        expect(page).to have_selector(:link_or_button, 'Delete')
        save_and_open_page
      end
    end

    context 'when Delete is clicked' do
      it "displays the alert message confirmation" do
        login_as user
        visit '/'
        click_link('Delete')
        expect(page).to have_content('Movie was successfully destroyed.')

      end
    end
  end
end
