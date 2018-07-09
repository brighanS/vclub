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

  context 'when logged in the GET  [show]' do
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

  context 'when logged in [create]' do
    it 'stores movies into Data Base' do
      sign_in user
      movie = Movie.create(name: 'name3',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      post :create, params: {name: movie.to_param,genre: movie.to_param,image_url: movie.to_param,price: movie.to_param,duration: movie.to_param}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  context 'when logged in the GET [edit]' do
    it 'returns http code 200 and edit template' do
      sign_in user
      movie = Movie.create(name: 'name2',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      get :edit, params: {id: movie.to_param}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  #NEGATIVE SCENARIOS
  context 'when NOT logged in the GET [new]' do
    it 'returns http code 302 and redirected to sign_in' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when NOT logged in the GET [index]' do
    it 'returns http code 302 and redirected to sign_in' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when NOT logged in the GET  [show]' do
    it 'returns http code 302 and redirected to sign_in' do
      movie = Movie.create(name: 'name1',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      get :show, params: {id: movie.to_param}
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end

#Keep description short:

#it {is_expected.to respond_with 422 }
