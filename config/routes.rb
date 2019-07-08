Rails.application.routes.draw do
  resources :creators
  resources :revenues
  # root to: "home#index"
  resources :entries
  devise_for :users
end
