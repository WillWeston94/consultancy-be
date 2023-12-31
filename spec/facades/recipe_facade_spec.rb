require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#searched_recipes' do
    it 'returns an array of Recipe objects', :vcr do
        recipe_facade = RecipeFacade.new("apple")

        recipes = recipe_facade.searched_recipes

        expect(recipes).to be_an(Array)
        expect(recipes.first).to be_a(SearchedRecipe)
    end
  end

  describe '#searched_recipes_with_intolerances' do
    it 'returns an array of Recipe objects', :vcr do
        recipe_facade = RecipeFacade.new("apple", "dairy")

        recipes = recipe_facade.searched_recipes_with_intolerances

        expect(recipes).to be_an(Array)
        expect(recipes.first).to be_a(SearchedRecipe)
    end
  end
end
