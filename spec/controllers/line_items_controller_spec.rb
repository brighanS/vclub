require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
    let(:user){FactoryBot.create :user}
    #let!(:line_item_attributes){FactoryBot.attributes_for(:line_item)}

    context 'when logged_in the POST [create]' do
      it 'creates a line_item and saves it into DataBase' do
        sign_in user
        @movie = FactoryBot.create(:movie)
        post :create, params: {movie_id: @movie.id}
        expect(response).to have_http_status(302)
      end
    end

end
