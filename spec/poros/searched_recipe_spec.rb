require  "rails_helper"

RSpec.describe SearchedRecipe do
  it "exists" do
    attrs = {
      id: "8",
      title: "Mom's Spaghetti",
      image: "https://image.url/knees_weak_arms_heavy"
    }

    searched_recipe = SearchedRecipe.new(attrs)

    expect(searched_recipe).to be_a SearchedRecipe
    expect(searched_recipe.id).to eq("8")
    expect(searched_recipe.name).to eq("Mom's Spaghetti")
    expect(searched_recipe.img_src).to eq("https://image.url/knees_weak_arms_heavy")
  end
end