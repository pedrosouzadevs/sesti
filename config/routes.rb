Rails.application.routes.draw do
  # api routes should be in /api/v1
  namespace :api do
    namespace :v1 do
      devise_for :users
      # root to: 'sessions#home'
      resources :sessions
      resources :equips
      resources :items
      resources :creatures
    end
  end


end
