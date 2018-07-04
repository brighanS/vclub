Rails.application.routes.draw do

  resources :payments
  resources :line_items
  resources :carts
  resources :movies


  devise_for :users

  get '*path', to: 'movies#index'
  root 'movies#index'
  get 'rent_a_movie', to: 'movies#make_a_rent'
  get 'index', to: 'movies#index'
  get 'users', to: 'movies#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
