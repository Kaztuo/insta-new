Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/terms_of_use'
  resources :users
end
