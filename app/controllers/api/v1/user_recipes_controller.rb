class Api::V1::UserRecipesController < ApplicationController
  def index
    recipe_ids = UserRecipe.select(:recipe_id).where("user_id = ?", params[:user_id]).pluck(:recipe_id)

    recipes = []

    recipe_ids.each do |id|
      data = RecipeService.new.recipes_by_id(id)
      recipes << SearchedRecipe.new(data)
    end

    render json: SearchedRecipeSerializer.new(recipes)
  end
end