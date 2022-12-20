Rails.application.routes.draw do
  devise_for :users
  root to: "submits#index"
  resources :users, only: [:edit, :update, :show]
  resources :submits, only: [:new, :create, :destroy, :show, :edit, :update] do
    resources :comments, only: :create
  end
end
