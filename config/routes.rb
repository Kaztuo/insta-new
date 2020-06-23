Rails.application.routes.draw do
  # get 'comments/new'
  # get 'comments/create'

  
  get     '/comments/search', to: 'comments#search'
  # get     '/comments', to: 'comments#index'
  
  # get 'sessions/new'
  # get 'photos/create'
  # get 'photos/show'
  root 'static_pages#home'
  get     '/terms',   to: 'static_pages#terms'
  get     '/signup',  to: 'users#new'
  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :password_resets
  resources :photos do
    resources :likes,               only: [:create, :destroy]
  end
  resources :comments
  resources :relationships,       only: [:create, :destroy]
  
end
