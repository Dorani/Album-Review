Rails.application.routes.draw do
  devise_for :users
  resources :albums do
    resources :reviews
  end
  root 'albums#index'
end
