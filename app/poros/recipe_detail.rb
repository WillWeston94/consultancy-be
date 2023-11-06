class RecipeDetail
  attr_reader :id, 
              :name, 
              :servings, 
              :readyInMinutes,
              :servingSize,
              :instructions,
              :ingredients

  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    @servings = data[:servings]
    @readyInMinutes = data[:readyInMinutes]
    @servingSize = data[:nutrition][:weightPerServing][:amount]
    @instructions = data[:instructions]
    @ingredients = parse_ingredients(data)
    # require "pry" ; binding.pry
  end

  def parse_ingredients(data)
    data[:extendedIngredients].map do |ingredient|
    {ingredient[:name] => ingredient[:original]}
    end
  end
end
