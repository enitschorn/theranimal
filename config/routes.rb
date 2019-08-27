Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'kitchen_sink', to: 'pages#kitchen_sink'

  resources :animals do
    resources :therapies, only: [ :new, :create, :index ]
  end
end
