Rails.application.routes.draw do

  get 'pastries/search' => 'pastries#search' # recherche dans la home page

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Authentication management

  resources :users, only: [:show, :edit, :update]
  # Users management (with orders)
  resources :pastries do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show, :update, :destroy]

  # Custom

  root to: 'pages#home'

end
