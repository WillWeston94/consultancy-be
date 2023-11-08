class Api::V1::SearchController < ApplicationController
  def index
    selected_recipes = specific_search
    #Possible refactor: I'm passing in the id in a weird way.
    render json: SearchedRecipeSerializer.new(selected_recipes)
  end

  def show
    recipe_details = RecipeIdFacade.new.get_recipe_details(params[:id])
    render json: RecipeDetailsSerializer.new(recipe_details)
  end
  
  private

  def specific_search
    if params[:q] && params[:intolerances]
      return RecipeFacade.new(params[:q], params[:intolerances]).searched_recipes_with_intolerances
    else
      return RecipeFacade.new(params[:q]).searched_recipes
    end
  end


end