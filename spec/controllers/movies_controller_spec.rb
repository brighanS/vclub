require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  include RSpecHtmlMatchers

  let(:user){FactoryBot.create :user}

  context 'when logged in the GET [index]' do
    it 'returns http code 200 and index template' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      #expect('<h1 class="display-1">Movies</h1>').to have_tag('h1', :with => { :class => 'display-1' })
    end
  end

  context 'when logged in the GET new [show]' do
    it 'returns http code 200 and show template' do
      sign_in user
      movie = Movie.create(name: 'name1',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      get :show, params: {id: movie.to_param}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  context 'when logged in the GET [new]' do
    it 'returns http code 200 and new template' do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  #NEGATIVE SCENARIOS
  context 'when not logged in the GET [new]' do
    it 'returns http code 200' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:)
    end
  end

end

#Keep description short:

#it {is_expected.to respond_with 422 }
