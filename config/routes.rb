Rails.application.routes.draw do
  resources :comments
  devise_for :users
  root to: 'items#index'
  
  resources :items
  
end