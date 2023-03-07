Rails.application.routes.draw do
  resources :users
  resources :stories, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index]
  # resources :categories, only: [:index, :show]
  resources :authors, only: [:index]
  # resources :authors, only: [:index, :show]
  # resources :quotes, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/:author_id/randomquote', to: 'authors#show'
  get '/:category_id/categoryquote', to: 'categories#show'
  get '/:author_id/quote', to: 'quotes#show'

  post '/login', to: 'sessions#login'
  post '/signup', to: 'sessions#signup'

  get "/profile/:id", to: "users#profile"
  post '/feed', to: "users#feed"

end
