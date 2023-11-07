require 'rails_helper'

RSpec.describe UserRecipesFacade do
  before(:each) do
    @user_id = 1
    @recipe1_id = 633386
    UserRecipe.create!(user_id: @user_id, recipe_id: @recipe1_id)

    @facade = UserRecipesFacade.new(@user_id)
  end

  it "exists" do
    expect(@facade).to be_a UserRecipesFacade
  end

  it "can fetch all recipes given a user ID", :vcr do
    results = @facade.fetch_user_recipes
    expect(results).to be_an Array
    expect(results.first.id).to eq(@recipe1_id)
  end
end