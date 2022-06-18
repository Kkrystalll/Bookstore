Rails.application.routes.draw do
  
  devise_for :users
  resource :orders, only: [:show ] 
  resources :books
  resources :coupons, only: [:index, :new, :create]
  root "books#index"
end
