Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  devise_scope :user do
    get 'change_password', to: 'devise/password#new'
  end
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
    resources :likes, only: [:create]
  end
end

  # API endpoints
  namespace :api do
    resources :users, only: [:index] do
      resources :posts, only: [:index], format: :json do
        resources :comments, only: [:index, :create], format: :json
      end
    end
  end
end