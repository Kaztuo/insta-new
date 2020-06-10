Rails.application.routes.draw do
  get 'photos/create'
  get 'photos/show'
  root 'static_pages#home'
  get     '/terms',   to: 'static_pages#terms'
  get     '/signup',  to: 'users#new'

  resources :users
  resources :password_resets
  resources :photos
end
