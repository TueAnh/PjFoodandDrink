Rails.application.routes.draw do
	root "static_pages#home"
  devise_for :users
  resources :products, only: [:index, :show]
  resources :categories
  resources :users, :only => [:show]
  resources :suggests
  resources :orders do
    resources :order_details
  end
  resource :cart
   as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
  end
  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :products
    resources :suggests, only: %i(index destroy update)
    resources :orders, only: %i(index update) do
      resources :order_details, only: :index
    end
    resources :users, only: %i(index destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
