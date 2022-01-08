module UsersHelper
    class << self
        def get_user_by_email(email)
            user = User.find_by(email:email)
        end
        def register_user(user_params)
            user = User.new(user_params)
            user.save! ? user : user.errors
        end
    end
end
