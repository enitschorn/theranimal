Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'kitchen_sink', to: 'pages#kitchen_sink'

  resources :animals
end
