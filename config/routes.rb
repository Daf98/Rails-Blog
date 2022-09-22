Rails.application.routes.draw do
  # get 'posts/id'
  # get 'posts/show'
  # get 'users/id'
  # get 'users/show'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
