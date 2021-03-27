class Recipe < ApplicationRecord
    has_one_attached :recipe_image  
    
    belongs_to :user
    belongs_to :cuisine
    
    def recipe_image_url
      Rails.application.routes.url_helpers.url_for(recipe_image) if recipe_image.attached?
    end
    
    def cuisine_name
      self.cuisine.name
    end 
end

