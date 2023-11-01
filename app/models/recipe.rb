class Recipe < ApplicationRecord
  validates :name, presence: true
  validats :image, presence: true
end