require  "rails_helper"

RSpec.describe RecipeDetail do
  it "exists" do
    attrs = {
      id: "654857",
      title: "Pasta On The Border",
      image: "https://spoonacular.com/recipeImages/654857-556x370.jpg",
      servings: "4",
      readyInMinutes: "45",
      nutrition: {
        weightPerServing: {
          amount: "540"
        }
      },
      analyzedInstructions: [{
        steps: [
          {
            number: "1",
            step: "Marinate strips of flank steak"
          }
        ]
      }],
      extendedIngredients: [
        {original: "4 Large Low-Fat Flour Tortilla"},
        {original: "1/2 pound Flank Steak, sliced into thin strips"}
      ]
    }

    recipe_detail = RecipeDetail.new(attrs)

    expect(recipe_detail).to be_a RecipeDetail
    expect(recipe_detail.id).to eq("654857")
    expect(recipe_detail.name).to eq("Pasta On The Border")
    expect(recipe_detail.img_src).to eq("https://spoonacular.com/recipeImages/654857-556x370.jpg")
    expect(recipe_detail.servings).to eq("4")
    expect(recipe_detail.readyInMinutes).to eq("45")
    expect(recipe_detail.servingSize_grams).to eq("540")
    expect(recipe_detail.instructions).to eq([{"1" => "Marinate strips of flank steak"}])
    expect(recipe_detail.ingredients).to eq(["4 Large Low-Fat Flour Tortilla", "1/2 pound Flank Steak, sliced into thin strips"])

  end
end