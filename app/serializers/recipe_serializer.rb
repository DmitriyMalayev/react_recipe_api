class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :recipe_image_url, :cuisine_id, :cuisine_name 
end



# def poster_url
#   Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
# end

    
    
# We can then adjust the serializer to use that as an attribute instead of poster

# class EventSerializer
#   include JSONAPI::Serializer
#   attributes :id, :name, :description, :start_time, :end_time, :location, :poster_url
# end