Rails.application.routes.draw do
  devise_for :users
  root to: "submits#index"
  resources :users, only: [:edit, :update]
  resources :submits, only: [:new, :create, :show]
end
