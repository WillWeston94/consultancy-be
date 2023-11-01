require "rails_helper"

RSpec.describe "Search for Recipes", type: :request do
  it "should return a list of recipes related to the keyword", :vcr do
    ingredient = "pasta"

    get "/api/v1/search?ingredients=#{ingredient}"

    expect(response).to be_successful

    recipes_data = JSON.parse(response.body, symbolize_names: true)

    recipes = recipes_data[:data]

    recipes.each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a(String)

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes][:name]).to be_a(String)
      expect(recipe[:attributes][:img_src]).to be_a(String)

      #This test will need to be expanded as we figure out our JSON contract with FE
    end
  end
end



