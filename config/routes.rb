Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'kitchen_sink', to: 'pages#kitchen_sink'

  resources :animals do
    resources :therapies, only: [ :new, :create, :index, :show, :edit, :destroy, :update ]
    resources :reviews, only: [:new, :create]
    resource :favorite, only: [:create, :destroy]
  end

  resources :dashboard, only: [:show]

  namespace :user do
    root :to => "dashboard#show"
  end
end
