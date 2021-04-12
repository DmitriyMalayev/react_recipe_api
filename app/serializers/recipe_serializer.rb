class RecipeSerializer 
  include JSONAPI::Serializer
  attributes :id, :name, :description, :recipe_image_url, :cuisine_id, :cuisine_name 
end

# recipe_image_url matches the instance method name in the recipe model