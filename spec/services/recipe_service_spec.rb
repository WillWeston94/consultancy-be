require 'rails_helper'

describe RecipeService do
  context "class methods" do
    context "#recipes_by_keyword" do
      it "returns recipes related to the keyword", :vcr do
        search = RecipeService.new.recipes_by_keyword("potato")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        recipe_data = search[:results].first

        expect(recipe_data).to have_key :id
        expect(recipe_data[:id]).to be_a(Integer)

        expect(recipe_data).to have_key :title
        expect(recipe_data[:title]).to be_a(String)

        expect(recipe_data).to have_key :image
        expect(recipe_data[:image]).to be_a(String)
      end
    end

    context "#recipes_by_keyword_and_intolerances" do
      it "returns recipes related to the keyword and intolerances", :vcr do
        search = RecipeService.new.recipes_by_keyword_and_intolerances("potato", "dairy")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        recipe_data = search[:results].first

        expect(recipe_data).to have_key :id
        expect(recipe_data[:id]).to be_a(Integer)

        expect(recipe_data).to have_key :title
        expect(recipe_data[:title]).to be_a(String)

        expect(recipe_data).to have_key :image
        expect(recipe_data[:image]).to be_a(String)
      end
    end

    context "#recipes_by_id" do
      it "returns recipe details for a recipe_id", :vcr do
        search = RecipeService.new.recipes_by_id("511728")
        #require "pry" ; binding.pry
        expect(search).to be_a Hash
        expect(search).to have_key :id
        expect(search[:id]).to be_a(Integer)
        
        expect(search).to have_key :title
        expect(search[:title]).to be_a(String)

        expect(search).to have_key :image
        expect(search[:image]).to be_a(String)

        expect(search).to have_key :servings
        expect(search[:servings]).to be_a(Integer)

        expect(search).to have_key :readyInMinutes
        expect(search[:readyInMinutes]).to be_a(Integer)

        expect(search[:nutrition][:weightPerServing]).to have_key :amount
        expect(search[:nutrition][:weightPerServing][:amount]).to be_a(Integer)
        
        expect(search[:analyzedInstructions][0][:steps].first).to have_key :step
        expect(search[:analyzedInstructions][0][:steps].first[:step]).to be_a(String)
        
        expect(search[:extendedIngredients].first).to have_key :original
        expect(search[:extendedIngredients].first[:original]).to be_a(String)
      end
    end
  end

  it "displays 100 results when able", :vcr do
    search = RecipeService.new.recipes_by_keyword("potato")

    expect(search[:number]).to eq(100)
  end


end