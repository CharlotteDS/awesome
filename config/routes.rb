Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :users, only: [:index, :update, :destroy]
    get 'users/home'
  end
  get 'users/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :sessions
end
