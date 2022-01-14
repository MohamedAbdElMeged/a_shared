module UserService
    class GetUserByEmail
        def initialize(email)
            @email = email
        end
        def call
        get_user_by_email
        @user
        end
        private
        def get_user_by_email
            @user = User.find_by(email: @email)
        
        end
        
    end
end