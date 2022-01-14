module AuthHelper
    class << self
        def encode_token(payload)
            JWT.encode(payload,APP_CONFIG['jwt_secret'])  
        end

        def create_token(user)
        exp = (Time.now + APP_CONFIG['jwt_expiration'].minutes).to_i
        encode_token({user: user ,exp: exp})
        end
        def decoded_token(auth_header)
            if auth_header
                token = auth_header
                begin
                    JWT.decode(token, APP_CONFIG['jwt_secret'], true, algorithm: 'HS256')
                rescue JWT::ExpiredSignature
                     nil
                rescue JWT::DecodeError
                     nil
                end
            end
        end
        def user_payload(user)
            user_load = {
                id: user.id,
                name: user.name,
                email: user.email
            }
        end
        def sign_in(email,password)
            user = UsersHelper.get_user_by_email(email)
            if user && user.valid_password?(password)
               user.auth_token = create_token(user_payload(user))
                user
            else
                nil
            end
          end
    end
end