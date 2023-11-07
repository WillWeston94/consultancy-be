require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:recipe_id)}
  end
end