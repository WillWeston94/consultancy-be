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
end