Rails.application.routes.draw do
  resources :device_table_mappings
  resources :menus
  resources :categories
  root to: 'visitors#index'
  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :users

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
