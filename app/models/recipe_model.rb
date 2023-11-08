class RecipeModel < ApplicationRecord
  validates :title, presence: true
  validates :servings, presence: true
  validates :prep_time, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  has_one_attached :image
end
