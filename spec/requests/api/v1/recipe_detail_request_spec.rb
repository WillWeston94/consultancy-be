require "rails_helper"

RSpec.describe "Search for Recipe by ID", type: :request do
  it "should return the recipe details for a given recipe id", :vcr do
    user_search = "511728"

    get "/api/v1/search/#{user_search}"

    expect(response).to be_successful

    recipe_data = JSON.parse(response.body, symbolize_names: true)

    recipe = recipe_data[:data]

    expect(recipe).to have_key(:id)
    expect(recipe[:id]).to be_a(String)

    expect(recipe).to have_key(:attributes)
    expect(recipe[:attributes][:name]).to be_a(String)
    expect(recipe[:attributes][:img_src]).to be_a(String)
    expect(recipe[:attributes][:servings]).to be_a(Integer)
    expect(recipe[:attributes][:readyInMinutes]).to be_a(Integer)
    expect(recipe[:attributes][:servingSize_grams]).to be_a(Integer)
    expect(recipe[:attributes][:instructions]).to be_an(Array)
    expect(recipe[:attributes][:instructions].first).to be_an(Object)
    expect(recipe[:attributes][:instructions].first[:"1"]).to be_a(String)
    expect(recipe[:attributes][:ingredients]).to be_an(Array)
    expect(recipe[:attributes][:ingredients].first).to be_a(String)
  end
end



