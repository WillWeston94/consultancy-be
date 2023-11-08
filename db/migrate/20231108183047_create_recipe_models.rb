class CreateRecipeModels < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_models do |t|
      t.string :title
      t.string :servings
      t.string :prep_time
      t.text :ingredients
      t.text :instructions
      t.string :image_url 
      
      t.timestamps
    end
  end
end
