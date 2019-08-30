Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'kitchen_sink', to: 'pages#kitchen_sink'

  resources :animals do
    resources :therapies
    resources :reviews, only: [:new, :create]
    resources :favorites, only: [:create]
  end

  delete '/animals/:animal_id/favorites', to: 'favorites#destroy'

  resources :dashboard, only: [:show]

  namespace :user do
    root :to => "dashboard#show"
  end
end
