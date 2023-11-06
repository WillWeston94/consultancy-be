class RecipeFacade
  attr_reader :keyword
  def initialize(keyword, intolerances = nil)
    @keyword = keyword
    @intolerances = intolerances 
  end

  def searched_recipes
    data = RecipeService.new.recipes_by_keyword(@keyword)

    data[:results].map do |recipe_data|
      SearchedRecipe.new(recipe_data)
    end
  end

  def searched_recipes_with_intolerances
    data = RecipeService.new.recipes_by_keyword_and_intolerances(@keyword, @intolerances)

    data[:results].map do |recipe_data|
      SearchedRecipe.new(recipe_data)
    end
  end
end