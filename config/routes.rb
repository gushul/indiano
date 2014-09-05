Rails.application.routes.draw do
  resources :products

  devise_for :users

  root "static_pages#home"
  get "static_pages/about"
end
