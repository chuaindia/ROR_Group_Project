Rails.application.routes.draw do
  devise_for :users

  get "/users/:user_id/public_recipes", to: "recipes#public_recipes"
  resources :users, only: [:show, :new, :create, :index, :destroy] do 
    resources :recipes, only: [:show, :new, :create, :index, :destroy] 
    resources :foods, only: [:show, :new, :create, :index, :destroy] 
  end
  resources :food_recipes, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#show'
end
