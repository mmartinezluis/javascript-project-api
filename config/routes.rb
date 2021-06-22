Rails.application.routes.draw do
  resources :users
  resources :stories
  resources :categories
  resources :authors
  resources :quotes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors, only: [:show] do 
    resources :quotes, only: [:show]
  end

  resources :categories, only: [:show] do
    resources :quotes, only: [:show]
  end

end
