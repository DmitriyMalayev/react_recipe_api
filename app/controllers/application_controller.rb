class ApplicationController < ActionController::API
    def current_user
        User.first_or_create(email: "test@test.com", password: "password")
    end 
end
# We have access to user_id because a User has many Recipes. 
