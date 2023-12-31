class RecipeDetail
  attr_reader :id, 
              :name,
              :img_src,
              :servings, 
              :readyInMinutes,
              :servingSize_grams,
              :instructions,
              :ingredients

  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    @img_src = data[:image]
    @servings = data[:servings]
    @readyInMinutes = data[:readyInMinutes]
    @servingSize_grams = data[:nutrition][:weightPerServing][:amount]
    @instructions = parse_instructions(data)
    @ingredients = parse_ingredients(data)
    # require "pry" ; binding.pry
  end

  def parse_ingredients(data)
    data[:extendedIngredients].map do |ingredient|
      ingredient[:original]
    end
  end

  def parse_instructions(data)
    data[:analyzedInstructions][0][:steps].map do |step|
      { step[:number] => step[:step] }
    end
  end
end
