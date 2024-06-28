Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'stages#index'
  resources :stages do
  end
  resources :users, only: :show
end