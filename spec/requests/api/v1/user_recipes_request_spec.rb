require 'rails_helper'

RSpec.describe "User Recipes Endpoint", type: :request do
  it "should return an array of recipes given a user ID", :vcr do
    recipe1 = UserRecipe.create!(user_id: 1, recipe_id: 633386)
    recipe2 = UserRecipe.create!(user_id: 1, recipe_id: 663931)
    recipe3 = UserRecipe.create!(user_id: 1, recipe_id: 663933)
    recipe4 = UserRecipe.create!(user_id: 2, recipe_id: 1)

    get "/api/v1/user_recipes?user_id=1"

    expect(response).to be_successful

    recipes_data = JSON.parse(response.body, symbolize_names: true)

    recipes = recipes_data[:data]

    recipes.each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a String
    
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a Hash

      attributes = recipe[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a String
      expect(attributes).to have_key(:img_src)
      expect(attributes[:img_src]).to be_a String
    end
  end

  it "allows the creation of a new UserRecipe via a post" do
    user_id = 1
    recipe_id = 213

    post "/api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user_recipe = UserRecipe.last
    expect(user_recipe.user_id).to eq(user_id)
    expect(user_recipe.recipe_id).to eq(recipe_id)
  end

  it "allows the deletion of a UserRecipe" do
    user_id = 1
    recipe_id = 213

    post "/api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}"

    expect(UserRecipe.last).to be_a UserRecipe

    delete "/api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(UserRecipe.last).to be nil
  end

  describe "sad paths" do
    xit "cannot add the same recipe twice" do
      #todo
    end
  end
end