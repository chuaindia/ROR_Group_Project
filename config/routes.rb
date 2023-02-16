Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :new, :create, :index, :destroy] do 
    resources :recipes, only: [:show, :new, :create, :index, :destroy] 
    resources :public_recipes, only: [:index] 
    resources :general_shopping_list, only: [:index]
    resources :foods, only: [:show, :new, :create, :index, :destroy] 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#show'
end
