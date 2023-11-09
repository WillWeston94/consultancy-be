class AddImageUrlToRecipeModels < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_models, :image_url, :string
  end
end
