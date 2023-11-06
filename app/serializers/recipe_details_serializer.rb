class RecipeDetailsSerializer
  include JSONAPI::Serializer
  attributes  :name, 
              :servings, 
              :readyInMinutes,
              :servingSize
end
