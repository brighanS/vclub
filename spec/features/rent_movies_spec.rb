require 'rails_helper'

RSpec.feature "RentMovies", type: :feature do
  describe "rent of a movie process when movies exists", :type => :feature do

    let(:user){create :user}
    let!(:movie){create :movie}

    context 'when logged_in the movies page' do
      it "displays Rent a Movie button" do
        login_as user
        visit '/'
        expect(page).to have_selector(:link_or_button, 'Rent a Movie')
      end
    end

    context 'when Rent a Movie is clicked' do
      it "displays the rent section" do
        login_as user
        visit '/'
        click_link('Rent a Movie')
        expect(page).to have_content('Select your movies:')
        expect(page).to have_button('Add to Cart')
        expect(page).to have_content movie.name
      end
    end

    #cartId: id="cart_div"
    context 'when add_to_cart is clicked' do
      it "adds selected movie into cart" do
        login_as user
        visit '/rent_a_movie'
        click_button('Add to Cart')
        expect(page).to have_css('#cart_div', text: movie.name)
        print page.html
      end
    end

  end
end
