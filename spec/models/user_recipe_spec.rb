require 'rails_helper'

RSpec.describe UserRecipe, type: :model do
  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:recipe_id)}
  end

  describe "class methods" do
    describe "#all_recipes_by_user" do
      it "returns an array of all recipes IDs for a given user ID" do
        user_id = 1
        recipe1_id = 10
        recipe2_id = 12
        recipe3_id = 1014
        recipe4_id = 948
        UserRecipe.create!(user_id: user_id, recipe_id: recipe1_id)
        UserRecipe.create!(user_id: user_id, recipe_id: recipe2_id)
        UserRecipe.create!(user_id: user_id, recipe_id: recipe3_id)

        expect(UserRecipe.all_recipes_by_user(user_id)).to include(recipe1_id, recipe2_id, recipe3_id)
        expect(UserRecipe.all_recipes_by_user(user_id)).to_not include(recipe4_id)
      end
    end
  end
end