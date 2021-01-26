Rails.application.routes.draw do
  devise_for :users
  resources :locations
  resources :saved_posts
  resources :comments
  resources :images
  resources :followers
  resources :posts do
    resources :likes
  end
  get '/users', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
