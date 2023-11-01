class RecipeFacade
  attr_reader :keyword
  def initialize
    @keyword = keyword
  end

  def searched_recipes
    data = RecipeService.new.recipes_by_keyword(@keyword)

    data[:data].map do |recipe_data|
      Recipe.new(recipe_data)