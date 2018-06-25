Rails.application.routes.draw do
  resources :movies

  get 'rent_a_movie', to: 'movies#make_a_rent'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
