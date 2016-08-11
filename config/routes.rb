Rails.application.routes.draw do
  resources :branches
  # get 'menu_images/destroy'

  resources :device_table_mappings
  resources :menus, :only => [:index, :show]

  resources :categories, :only => [:index, :show]
  
  root to: 'orders#index'
  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :users

  resources :orders do
    collection do
      get :full_screen
      post :update_status
    end
  end

  resources :settings do
    collection do
      post :upload_images
      post :sync
    end
  end

  resources :reservations, only: [:index]

  namespace :api do
  	namespace :v1 do
      resources :categories do
        collection do
          get :sync
          get :dirty
        end
      end

      resources :menus, none: true do
        collection do
          get :by_restaurant_owner          
        end
      end

      resources :menus
      resources :devices do
        collection do
          post :updated
        end
      end
      resources :orders
      resource :user do
        get :get_api_key, on: :member
      end
      resources  :reservations, only: [:create]
      resources :order_logs, only: [:index]
  	end
  end

  namespace :control_panel do
    resources :users, :only => [:index] do
      collection do
        post :approve_disapprove
      end
    end
  end

end
