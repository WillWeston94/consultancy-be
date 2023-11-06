class RecipeIdFacade
  def get_recipe_details(recipe)
    data = RecipeService.new.recipes_by_id(recipe)
    data.map do |recipe_data|
      RecipeDetail.new(recipe_data)
    end
  end

end