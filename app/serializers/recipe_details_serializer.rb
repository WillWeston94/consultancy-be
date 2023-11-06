class RecipeDetailsSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :servings, 
              :readyInMinutes,
              :servingSize_grams,
              :instructions,
              :ingredients
end
