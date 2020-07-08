# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  root 'static_pages#home'
  get     '/comments/search', to: 'comments#search'
  get     '/terms',   to: 'static_pages#terms'
  post    '/signup',  to: 'users#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :password_resets
  resources :photos
  resources :likes, only: %i[create destroy]
  resources :comments
  resources :relationships,       only: %i[create destroy]
  resources :notifications,       only: :index
end
