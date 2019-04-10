Rails.application.routes.draw do
  get 'products/show'

	root "static_pages#home"

  devise_for :users
  resources :products
  resources :categories
  resources :users, :only => [:show]
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
    resources :suggests, only: %i(index destroy update)
    resources :orders, only: %i(index update) do
      resources :order_items, only: :index
    end
    resources :users#, only: %i(index destroy)
  end
end
