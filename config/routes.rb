Rails.application.routes.draw do

  get 'messages/index'

  get 'conversations/index'

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
	root "static_pages#home"
  devise_for :users
  resources :products, only: [:index, :show]
  resources :categories
  resources :users, :only => [:show]
  resources :suggests
  resources :orders do
    resources :order_items
  end
  get "/search", to: "filters#show"
  resource :cart
   as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :products
    resources :suggests
    resources :orders do
      resources :order_items, only: :index
    end
    resources :users#, only: %i(index destroy)
  end

end
