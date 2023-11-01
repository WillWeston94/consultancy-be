class Api::V1::SearchController < ApplicationController
  def index
    selected_recipes = RecipeFacade.new(params[:ingredients])
    #I think we'll need to add a method at the end of line 3, once we get facades squared away
    render json: SearchedRecipeSerializer.new(selected_recipes)
    #We'll want to enter a begin and rescue clause later
  end
end