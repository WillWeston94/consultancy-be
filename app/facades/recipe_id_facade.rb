class RecipeIdFacade
  def get_recipe_details(recipe)
    data = RecipeService.new.recipes_by_id(recipe)
    # require "pry" ; binding.pry
      RecipeDetail.new(data)
  end

end