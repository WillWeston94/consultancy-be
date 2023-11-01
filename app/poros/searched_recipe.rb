class SearchedRecipe
  attr_reader :id, :name
  def initialize(data)
    @id = data[:attributes][:id]
    @name = data[:attributes][:name]
  end
end