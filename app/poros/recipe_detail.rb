class RecipeDetail
  attr_reader :id, 
              :name, 
              :servings, 
              :readyInMinutes,
              :servingSize

  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    @servings = data[:servings]
    @readyInMinutes = data[:readyInMinutes]
    @servingSize = data[:nutrition][:weightPerServing][:amount]
  end
end
