Rails.application.routes.draw do

  resources :line_items
  resources :carts
  resources :movies


  devise_for :users

  root to: 'movies#index'
  get 'rent_a_movie', to: 'movies#make_a_rent'
  get 'index', to: 'movies#index'

  get "payment", to: 'payments#hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
