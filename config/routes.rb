Rails.application.routes.draw do
  # Authentication management
  devise_for :users

  # Users management (with orders)
  resources :users, only: [:show] do
    resources :orders, only: [:new, :create, :show, :destroy]
  end

  # Custom pages
  root to: 'pages#home'
  get 'pastries/search' => 'pastries#search' # recherche dans la home page
  resources :pastrieshow
end
