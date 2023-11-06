class RecipeDetail
  attr_reader :id, :name
  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    # @servings = data[:servings]
    # @readyInMinutes = data[:readyInMinutes]
  end
end
