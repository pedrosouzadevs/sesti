Rails.application.routes.draw do
  get 'helmets/show'
  devise_for :users
  root to: 'sessions#home'
  resources :sessions, only: [:index, :show, :create]
end
