class RecipeDetailsSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :servings, 
              :readyInMinutes,
              :servingSize,
              :instructions,
              :ingredients
end
