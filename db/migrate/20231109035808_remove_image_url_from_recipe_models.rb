class RemoveImageUrlFromRecipeModels < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_models, :image_url, :string
  end
end
