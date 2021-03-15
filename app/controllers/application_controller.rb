class ApplicationController < ActionController::API
    def current_user
        User.first_or_create(email: "test@test.com", encrypted_password: "password")
    end 
end
