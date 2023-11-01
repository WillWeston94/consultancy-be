class SearchedRecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end