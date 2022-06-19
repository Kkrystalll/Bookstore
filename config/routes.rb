Rails.application.routes.draw do
  
  devise_for :users
  resources :orders, only: [:index, :create, :show, :update, :destroy ] 
  resources :books, except: [:show ]
  resources :coupons, only: [:index, :new, :create ]

  namespace :api do
    namespace :v1 do
      resource :orders, only: [] do
        post :add_to_cart
      end
    end
  end

  root "books#index"
end
