Rails.application.routes.draw do
  
  devise_for :users
  resource :orders, only: [:show ] 
  root "books#index"
  resources :books

end
