class RecipeFacade
  attr_reader :keyword
  def initialize(keyword)
    @keyword = keyword
  end

  def searched_recipes
    data = RecipeService.new.recipes_by_keyword(@keyword)

    data[:results].map do |recipe_data|
      SearchedRecipe.new(recipe_data)
    end
  end

  def get_recipe_details(recipe)
    data = RecipeService.new.recipes_by_id(recipe)
    data[:results].map do |recipe_data|
      Recipe.new(recipe_data)
    end

  end
end