Rails.application.routes.draw do
  get 'sessions/new'
  get 'photos/create'
  get 'photos/show'
  root 'static_pages#home'
  get     '/terms',   to: 'static_pages#terms'
  get     '/signup',  to: 'users#new'

  resources :users
  resources :password_resets
  resources :photos
  resources :sessions,      only: [:new, :create, :destroy]
end
