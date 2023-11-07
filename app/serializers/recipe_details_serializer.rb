class RecipeDetailsSerializer
  include JSONAPI::Serializer
  attributes  :name,
              :img_src,
              :servings, 
              :readyInMinutes,
              :servingSize_grams,
              :instructions,
              :ingredients
end
