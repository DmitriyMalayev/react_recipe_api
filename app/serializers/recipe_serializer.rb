class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :recipe_image
end
