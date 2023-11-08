require 'rails_helper'

RSpec.describe RecipeIdFacade do
  describe '#recipe_details' do
    it 'returns a recipe details object object', :vcr do

        recipes = RecipeIdFacade.new.get_recipe_details("511728")

        expect(recipes).to be_an(Object)
        expect(recipes).to be_a(RecipeDetail)
    end
  end
end