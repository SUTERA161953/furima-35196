Rails.application.routes.draw do
  get 'buys/index'
  get 'buys/create'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :create]
  end
end