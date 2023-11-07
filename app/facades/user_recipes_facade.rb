class UserRecipesFacade
  def initialize(id)
    @id = id
  end

  def fetch_user_recipes
    recipe_ids = UserRecipe.all_recipes_by_user(@id)
    service = RecipeService.new
    
    recipe_ids.map do |recipe_id|
      SearchedRecipe.new(service.recipes_by_id(recipe_id))
    end
  end
end