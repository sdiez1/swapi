Rails.application.routes.draw do
  resources :starships do
  	get 'starships/:id'=> 'starships#show'
  end
  resources :planets do
  	get 'planets/:id'=> 'planets#show'
  end
  resources :characters do
  	get 'characters/:id'=> 'characters#show'
  end
  resources :movies do
  	get 'movies/:id'=> 'movies#show'
  end

  root 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end