class Api::V1::RecipeModelsController < ApplicationController
  def create
    binding.pry
    @recipe = RecipeModel.new(recipe_params)
  
    if @recipe.save
      @recipe.image.attach(params[:recipe][:image])
  
      serialized_recipe = RecipeDetailsSerializer.new(@recipe).serializable_hash
  
      render json: serialized_recipe, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  private

  def recipe_params
    params.require(:recipe).permit(:title, :image, :servings, :prep_time, :ingredients, :instructions, :user_id)
  end
end