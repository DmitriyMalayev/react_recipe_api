user1 = User.first_or_create(email: "italian@italy.com", password: "password")  

cuisine1 = Cuisine.find_or_create_by(name: "Italian")
cuisine2 = Cuisine.find_or_create_by(name: "Bukharian")
cuisine3 = Cuisine.find_or_create_by(name: "Russian")

recipe1 = user1.recipes.find_or_create_by!(name: "Italian Dish", description: "Italian Pasta, Water, Sauce", cuisine_id: cuisine1.id)
recipe2 = user1.recipes.find_or_create_by!(name: "Bukharian Dish", description: "Kikoho Rice, Water, Carp Fish", cuisine_id: cuisine2.id)
recipe3 = user1.recipes.find_or_create_by!(name: "Russian Dish", description: "Dough, Water, Potatoes", cuisine_id: cuisine3.id)

# exclamation mark will raise exception and show errors if they occur 