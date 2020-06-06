Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/terms_of_use'
  resources :users
end
