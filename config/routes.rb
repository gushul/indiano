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

  # get "*id" => 'pages#show', eas: :page, format: false
  get "/static_pages/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'

  # Mast be last line
  get "*any", via: :all, to: "errors#not_found"
end
