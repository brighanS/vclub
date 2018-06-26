Rails.application.routes.draw do

  devise_for :users
  get 'landing/selector'
  resources :movies
  root to: 'movies#index'
  get 'rent_a_movie', to: 'movies#make_a_rent'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
