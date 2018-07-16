require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user){FactoryBot.create :user}

  context 'when logged_in the POST [create]' do
    it 'returns http code 302 and stores cart in DataBase' do
      sign_in user
      cart = create(:cart)
      post :create, params: {id: cart.id , cart: attributes_for(:cart)}

      expect(response).to have_http_status(302)
      expect(Cart.count).to eq(2)
    end
  end

  context 'when logged_in and Payment is Succesful' do
    it 'returns http code 302 and deletes cart from database' do
      sign_in user
      @cart = create(:cart)
      delete :destroy, params: {id: @cart.id}, format: :js
      expect(Cart.count).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end
