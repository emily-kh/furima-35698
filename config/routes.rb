Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  # resources :addresses
  resources :items do
    resources :purchase_users, only:[:index,:create]
  end
end
