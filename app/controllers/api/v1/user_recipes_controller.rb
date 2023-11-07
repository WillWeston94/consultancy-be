class Api::V1::UserRecipesController < ApplicationController
  def index
    recipes = UserRecipesFacade.new(params[:user_id]).fetch_user_recipes
    render json: SearchedRecipeSerializer.new(recipes)
  end

  def create
    UserRecipe.create!(user_recipe_params)
    render json: {}, status: 200
  end

  def destroy
    user_recipe = UserRecipe.find_by(user_id: params[:user_id], recipe_id: params[:recipe_id])
    user_recipe.destroy
    render json: {}, status: 200
  end

  private

  def user_recipe_params
    params.permit(:user_id, :recipe_id)
  end
end