Rails.application.routes.draw do
  # Authentication management
  devise_for :users
  resources :users, only: [:show]
  # Users management (with orders)
  resources :pastries do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show, :update, :destroy]

  # Custom
  root to: 'pages#home'
  get 'pastries/search' => 'pastries#search' # recherche dans la home page
end
