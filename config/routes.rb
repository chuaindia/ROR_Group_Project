Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :new, :create, :index, :destroy] do 
    resources :recipes, only: [:show, :new, :create, :index, :destroy] do
      resources :general_shopping_list, only: [:index]
    end
    resources :public_recipes, only: [:index] 
    resources :foods, only: [:index, :new, :create, :show, :destroy] 
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#show'
end
