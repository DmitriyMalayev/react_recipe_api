class Cuisine < ApplicationRecord
  has_many :recipes
end


# A cuisine has many recipes
# A recipe belongs to a cuisine