Rails.application.routes.draw do
  get "bookings/new"
  devise_for :users
  
  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create, :show]
  
  root "flights#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
