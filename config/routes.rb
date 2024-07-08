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
    member do
      get 'participate'
      get 'pay'
      get 'completion'
    end
    resources :applies do
      resources :comments, only: :create
    end
  end
  
  resources :users, only: [:show]do
  member do
    get 'charge', to: 'users#charge', as: 'charge_user'
    post 'charge', to: 'users#do_charge'
  end
end
resources :contacts, only: [:new, :create] do
  collection do
    post :confirm
    get :complete
  end
end
end