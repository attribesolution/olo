Rails.application.routes.draw do
  get 'menu_images/destroy'

  resources :device_table_mappings
  resources :menus do
    resources :menu_images, :only => [:destroy]
    collection do
      delete 'destroy_multiple'
      post :approve_disapprove_menus  
      post :add_dirty_menus
    end
  end

  resources :categories do
    collection do
      delete 'destroy_multiple'
    end
  end
  
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
    end
  end

  namespace :api do
  	namespace :v1 do
      resources :categories do
        collection do
          get :sync
          get :dirty
        end
      end
      resources :menus
      resources :devices
      resources :orders
      resource :user do
        get :get_api_key, on: :member
      end
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
