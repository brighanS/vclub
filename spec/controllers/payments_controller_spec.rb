require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  include RSpecHtmlMatchers

  let(:user){FactoryBot.create :user}

    context 'when logged_in, the [create]' do
      it 'creates payment and stores it into Data Base' do
        sign_in user
        post :create, params: {}
        expect(response).to have_http_status(302)
      end
    end
end
