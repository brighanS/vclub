require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context 'GET movies#index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success   #same than:     response.success
    end
  end
end
