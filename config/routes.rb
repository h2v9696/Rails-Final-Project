Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/auth/:provider/callback", to: "sessions#create"
    get "/auth/failure", to: "sessions#failure"
    get "/cart", to: "cart#cart"
    get "/cart/checkout", to: "cart#checkout"

    get "/product/:id", to: "products#show"
    resources :users
    resources :products, except: [:show]
    resources :account_activations, only: :edit
    resources :password_resets, except: [:show, :index, :destroy]
  end
end
