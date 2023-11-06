class RecipeDetailsSerializer
  include JSONAPI::Serializer
  attributes  :name,
              :image,
              :servings, 
              :readyInMinutes,
              :servingSize_grams,
              :instructions,
              :ingredients
end
