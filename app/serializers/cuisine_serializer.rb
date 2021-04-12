class CuisineSerializer  
  include JSONAPI::Serializer
  attributes :id, :name
  has_many :recipes
end
