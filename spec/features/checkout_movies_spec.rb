require 'rails_helper'

RSpec.feature "CheckoutMovies", type: :feature do
  describe "cart checkout process when movies exists", :type => :feature do

    let(:user){create :user}
    let!(:movie){create :movie}

    #cartId: id="cart_div"
    context 'when cart has content' do
      it "display the checkout  button" do
        login_as user
        visit '/rent_a_movie'
        click_button('Add to Cart')
        expect(page).to have_css('#cart_div', text: "Your cart:")
        expect(page).to have_button('checkout')
      end
    end

    context 'when checkout button is clicked' do
      it "display a modal message" do
        login_as user
        visit '/rent_a_movie'
        click_button('Add to Cart')
        within('#cart_div')do
          click_button('checkout')
        end
        expect(page).to have_css('.modal-dialog')
      end
    end

    context 'when payment is successful' do
      it "display a successful modal dialog" do
        #allow(cart_controller_instance).to receive(:payment_success?).and_return(true)
        allow(Cart).to receive(:payment_success?).and_return(true)
        login_as user
        visit '/rent_a_movie'
        click_button('Add to Cart')
        within('#cart_div') do
          click_button('checkout')
        end
          expect(page).to have_css('.modal-dialog', text: 'x Payment Succesful' )
      end
    end

    context 'when payment is forbidden' do
      it "display a forbidden modal message" do
        allow(Cart).to receive(:payment_success?).and_return(false)
        login_as user
        visit '/rent_a_movie'
        click_button('Add to Cart')
        within('#cart_div')do
          click_button('checkout')
        end
        expect(page).to have_css('.modal-dialog', text: 'x Payment Forbidden. Payments are still pending' )
      end
    end

  end

end
