module UserService
    class SignInUser
        def initialize(email,password)
            @email = email
            @password = password
        end
        def call
            sign_in
            @user
        end
        private
        def encode_token(payload)
            JWT.encode(payload,APP_CONFIG['jwt_secret'])  
        end
        def create_token
            exp = (Time.now + APP_CONFIG['jwt_expiration'].minutes).to_i
            encode_token({user: @user_load ,exp: exp})
        end
        def user_payload
            @user_load = {
                id: @user.id,
                name: @user.name,
                email: @user.email
            }
        end
        def sign_in
            @user = UserService::GetUserByEmail.new(@email).call
            if @user && @user.valid_password?(@password)
                user_payload
               @user.auth_token = create_token
               
            else
                nil
            end
        end
    end
end