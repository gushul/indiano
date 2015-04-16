Indiano::Application.routes.draw do
  mount_roboto
  devise_for :admins
  resources :categories
  resources :products
  resources :pictures
  resource :shopping_carts
  devise_scope :admin do
    get "/admin" => "devise/sessions#new"
  end
  get 'sitemap' => 'home#sitemap'

  # Mast be last line
  get "*any", via: :all, to: "errors#not_found"
end
