Rails.application.routes.draw do
  resources :locations
  resources :saved_posts
  resources :comments
  resources :images
  resources :likes
  resources :followers
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
