Rails.application.routes.draw do
  
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Authentication management
 
  resources :users, only: [:show]
  # Users management (with orders)
  resources :pastries do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show, :destroy]

  # Custom

  root to: 'pages#home'
  get 'pastries/search' => 'pastries#search' # recherche dans la home page
end
