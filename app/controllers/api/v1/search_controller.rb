class Api::V1::SearchController < ApplicationController
  def index
    selected_recipes = RecipeFacade.new(params[:q]).searched_recipes
    #I think we'll need to add a method at the end of line 3, once we get facades squared away
    #Possible refactor: I'm passing in the id in a weird way.
    render json: SearchedRecipeSerializer.new(selected_recipes)
    #We'll want to enter a begin and rescue clause later
  end

  def show
    recipe_details = RecipeIdFacade.new.get_recipe_details(params[:id])
    
    render json: RecipeDetailsSerializer.new(recipe_details)
  end

end