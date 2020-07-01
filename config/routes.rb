Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'static_pages#home'
  get     '/comments/search', to: 'comments#search'
  get     '/terms',   to: 'static_pages#terms'
  # get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  # get     '/login',  to: 'sessions#new'
  # post    '/login',  to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :password_resets
  resources :photos
  resources :likes,               only: [:create, :destroy]
  resources :comments
  resources :relationships,       only: [:create, :destroy]
  resources :notifications,       only: :index
  
end
