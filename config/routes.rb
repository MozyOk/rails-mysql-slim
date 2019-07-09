Rails.application.routes.draw do
  root to: "entries#index"
  resources :creators
  resources :revenues
  resources :entries
  devise_for :users
end
