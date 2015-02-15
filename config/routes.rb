Indiano::Application.routes.draw do

  root "static_pages#home"
  get "static_pages/about",   as: :about
  get "static_pages/contact", as: :contact
  get "static_pages/buy",     as: :how_to_buy
  resources :products 
end
