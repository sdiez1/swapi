Rails.application.routes.draw do
  resources :starships
  resources :planets
  resources :characters
  resources :personas
  resources :movies
  	get 'movies/:id'=> 'movies#show'
	root 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end