class SearchedRecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :img_src
end