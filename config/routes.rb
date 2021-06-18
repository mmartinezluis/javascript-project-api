Rails.application.routes.draw do
  resources :users
  resources :stories
  resources :categories
  resources :authors
  resources :quotes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
