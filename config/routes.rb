Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    resources :cars
  end

  resources :cars, only: [:index, :show] do
    member do
      post 'book' 
    end
  end
end
