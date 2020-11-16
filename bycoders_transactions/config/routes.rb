Rails.application.routes.draw do
  unless Rails.env.production?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'home#index'

  resources :financial_operations, only: [:index] do
    post :import, on: :collection
  end
end
