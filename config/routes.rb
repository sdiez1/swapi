Rails.application.routes.draw do
  resources :starships
  resources :planets
  resources :movies
  resources :characters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end