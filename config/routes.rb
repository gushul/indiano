Indiano::Application.routes.draw do
  mount_roboto
  resources :categories
  resources :products
  resources :pictures
  resource :shopping_carts
  get 'sitemap' => 'home#sitemap'
  get "/catalog_pdf" => 'home#catalog_pdf'

  get "/static_pages/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'

  # Mast be last line
  get "*any", via: :all, to: "errors#not_found"
end
