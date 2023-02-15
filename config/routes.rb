Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  get 'general_shopping_list/index'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:new, :edit, :create, :update, :destroy]
      resources :general_shopping_list, only: [:index]
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
end
