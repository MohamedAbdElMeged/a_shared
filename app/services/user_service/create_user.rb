module UserService
    class CreateUser
        def initialize(name,email,password,password_confirmation)
        @name = name
        @email = email
        @password = password
        @password_confirmation = password_confirmation
        end
        def call
            create_user
            @user
        end
        private
        def create_user
            @user = User.create!(
                name: @name,
                email: @email,
                password: @password
            )
        end
    end
    
end