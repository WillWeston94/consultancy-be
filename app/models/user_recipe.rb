class UserRecipe < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :recipe_id

  def self.all_recipes_by_user(id)
    UserRecipe.where("user_id = ?", id).pluck(:recipe_id)
  end
end