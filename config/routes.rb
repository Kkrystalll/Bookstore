Rails.application.routes.draw do
  
  devise_for :users
  resources :orders, only: [:index ] do
    collection do
      post :return_response
    end
  end

  namespace :admin do
    resources :books, except: [:show ] do

    end
    resources :coupons, only: [:index, :new, :create, :destroy] do

    end
  end

  resources :books, only: [:index ]
  # resources :coupons, only: [:index, :new, :create ]
  

  namespace :api do
    namespace :v1 do
      resources :orders, only: [] do
        collection do
          post :add_to_cart
        end

        member do
          delete :remove_to_cart
          patch :select_coupon
        end
      end
    end
  end

  root "books#index"
end
