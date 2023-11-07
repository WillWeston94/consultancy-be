class UserRecipe < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :recipe_id
end