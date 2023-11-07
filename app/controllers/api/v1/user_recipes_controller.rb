class Api::V1::UserRecipesController < ApplicationController
  def index
    recipes = UserRecipesFacade.new(params[:user_id]).fetch_user_recipes
    render json: SearchedRecipeSerializer.new(recipes)
  end
end