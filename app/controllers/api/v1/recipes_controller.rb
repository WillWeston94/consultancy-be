class Api::V1::RecipesController < ApplicationController
  def create
    recipe_hash = JSON.parse(request.body.read(), symbolize_names: true)
    RecipeModel.create(
      title: recipe_hash[:title],
      servings: recipe_hash[:servings],
      prep_time: recipe_hash[:prep_time],
      ingredients: recipe_hash[:ingredients],
      instructions: recipe_hash[:instructions],
      image_url: nil
    )
    # require 'pry';binding.pry
  end
end