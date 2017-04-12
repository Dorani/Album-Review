Rails.application.routes.draw do
  devise_for :users
  resources :albums
  root 'albums#index'
end
