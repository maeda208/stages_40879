Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'stages#index'
  resources :stages do
    collection do
      get 'participate'
    end
  end
  resources :users, only: [:show,:new,:create,:update]
end