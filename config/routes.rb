Rails.application.routes.draw do
  get 'menu_images/destroy'

  resources :device_table_mappings
  resources :menus do
    resources :menu_images, :only => [:destroy]
  end
  resources :categories
  root to: 'visitors#index'
  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :users

  resources :orders do
    collection do
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

end
