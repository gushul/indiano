Indiano::Application.routes.draw do
  devise_for :admins
  resources :categories
  resources :products
  resources :pictures
  resource :shopping_carts
  devise_scope :admin do
    get "/admin" => "devise/sessions#new"
  end
end
