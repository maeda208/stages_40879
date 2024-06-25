Rails.application.routes.draw do
  devise_for :users
  root to: 'stages#index'
  resources :stages
  resources :users, only: :show
end
