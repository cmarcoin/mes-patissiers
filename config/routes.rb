Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pastries/search' => 'pastries#search' # recherche dans la home page
  resources :pastries
  get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
