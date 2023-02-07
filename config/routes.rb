Rails.application.routes.draw do
  resources :users
  resources :stories, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :quotes, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#login'
  post '/signup', to: 'sessions#signup'

end
