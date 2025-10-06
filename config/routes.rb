Rails.application.routes.draw do
  get 'users/show'
  devise_for :users  

  root "prototypes#index"
  get 'messages/index'
  get "up" => "rails/health#show", as: :rails_health_check

    resources :prototypes do
    resources :comments, only: :create
    end

    resources :users, only: :show

    #get "up" => "rails/health#show", as: :rails_health_check

  end