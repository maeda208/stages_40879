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
    end
    resources :applies do
      resources :comments, only: :create
    end
  end
  
  resources :users, only: [:show,:new,:create,:update]
  get '*path', to: 'application#fallback_index_html', constraints: ->(request) { !request.xhr? && request.format.html? }
end