Rails.application.routes.draw do
  root 'static_pages#home'
  get     '/terms',   to: 'static_pages#terms'
  get     '/signup',  to: 'users#new'

  resources :users
end
