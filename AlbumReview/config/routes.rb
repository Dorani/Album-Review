Rails.application.routes.draw do
  resources :albums
  root 'albums#index'
end
