Rails.application.routes.draw do
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  resources :users
end
