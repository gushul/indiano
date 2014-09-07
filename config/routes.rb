Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  devise_for :users

  root "static_pages#home"
  get "static_pages/about"
end
