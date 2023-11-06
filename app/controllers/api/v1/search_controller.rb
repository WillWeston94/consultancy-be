class Api::V1::SearchController < ApplicationController
  def index
    selected_recipes = RecipeFacade.new(params[:q]).searched_recipes
    #Possible refactor: I'm passing in the id in a weird way.
    render json: SearchedRecipeSerializer.new(selected_recipes)
  end
end