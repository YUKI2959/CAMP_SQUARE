Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'

  devise_for :users

  root to: "submits#index"

  resources :users, only: [:edit, :update, :show]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :submits, only: [:new, :create, :destroy, :show, :edit, :update] do
    resources :comments, only: :create
  end
end
