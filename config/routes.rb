Rails.application.routes.draw do
  root 'sessions#new'
  resources :posts
  resources :sessions, only: [:new,:create,:destroy]
  resources :users
end
