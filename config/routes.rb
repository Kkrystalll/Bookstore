Rails.application.routes.draw do
  
  devise_for :users
  resources :orders, only: [:index, :create, :show, :update, :destroy ] do
    collection do
      post :return_response
    end
  end

  resources :books, except: [:show ]
  resources :coupons, only: [:index, :new, :create ]
  

  namespace :api do
    namespace :v1 do
      resources :orders, only: [] do
        collection do
          post :add_to_cart
        end

        member do
          delete :remove_to_cart
        end
      end
    end
  end

  root "books#index"
end
