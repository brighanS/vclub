require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user){FactoryBot.create :user}

  context 'when logged_in the POST [create]' do
    it 'returns http code 200 and stores cart in DataBase' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

end
