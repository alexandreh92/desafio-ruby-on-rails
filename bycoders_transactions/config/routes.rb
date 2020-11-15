Rails.application.routes.draw do
  root to: 'home#index'

  resources :financial_operations, only: [:index] do
    post :import, on: :collection
  end
end
