class SearchedRecipe
  attr_reader :id, :name, :img_src
  def initialize(data)
    @id = data[:id]
    @name = data[:title]
    @img_src = data[:image]
  end
end