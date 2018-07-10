require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  include RSpecHtmlMatchers

  let(:user){FactoryBot.create :user}

  context 'when logged_in the GET [index]' do
    it 'returns http code 200 and index template' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  context 'when logged_in the GET  [show]' do
    it 'returns http code 200 and show template' do
      sign_in user
      movie = Movie.create(name: 'name1',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      get :show, params: {id: movie.to_param}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  context 'when logged_in the GET [new]' do
    it 'returns http code 200 and new template' do
      sign_in user
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  context 'when logged_in, the [create]' do
    it 'stores movies into Data Base' do
      sign_in user
      post_params = attributes_for(:movie)
      post :create, params: {movie: post_params}
      expect(response).to redirect_to :action => :show, :id => assigns(:movie).id
    end
  end

  context 'when logged_in the GET [edit]' do
    it 'returns http code 200 and edit template' do
      sign_in user
      movie = Movie.create(name: 'name2',genre: 'genre',image_url: 'image_url.jpg', price: 100, duration: 60)
      get :edit, params: {id: movie.to_param}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

####CURRENT
  # context 'when logged_in, the [update]' do
  #   it 'changes movies from Data Base' do
  #     sign_in user
  #     @movie = attributes_for(:movie)
  #     @movie_id = @movie.id
  #     byebug
  #     put :update, {:id => movie_id}, params: {movie: movie}
  #   end
  # end

  #NEGATIVE SCENARIOS
  context 'when NOT logged_in the GET [new]' do
    it 'returns http code 302 and redirected to sign_in' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when NOT logged_in the GET [index]' do
    it 'returns http code 302 and redirected to sign_in' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when NOT logged_in the GET  [show]' do
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
