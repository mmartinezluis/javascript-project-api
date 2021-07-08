Rails.application.routes.draw do
  resources :users
  resources :stories
  resources :categories
  resources :authors
  resources :quotes, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do 
    resources :quotes, only: [:show]
  end

end
