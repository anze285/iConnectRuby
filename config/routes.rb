Rails.application.routes.draw do
  resources :profiles do
    resources :followers
  end
  resources :discoveries
  devise_for :users
  resources :locations
  resources :saved_posts
  resources :images
  resources :posts do
    resources :comments
    resources :likes
  end
  get '/users', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
