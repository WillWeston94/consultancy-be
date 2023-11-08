Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :v1 do 
      resources :recipe_models, only: [:create]
      resources :search, only: [:index, :show]
      resources :user_recipes, only: [:index, :create]
      delete "/user_recipes", to: "user_recipes#destroy" # hand-rolling to prevent a need for a UserRecipe ID
    end
  end
end
