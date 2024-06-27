Rails.application.routes.draw do
  devise_for :users
  root to: 'stages#index'
  resources :stages do
  end
  resources :users, only: :show
end