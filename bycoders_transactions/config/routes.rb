Rails.application.routes.draw do
  resources :financial_operations, only: [:index] do
    post :import, on: :collection
  end
end
