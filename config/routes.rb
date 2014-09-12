Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products


  root "static_pages#home"
  get "static_pages/about",   as: :about
  get "static_pages/contact", as: :contact
  get "static_pages/buy",     as: :how_to_buy
end
