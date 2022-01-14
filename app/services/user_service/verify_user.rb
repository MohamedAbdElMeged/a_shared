module UserService
    class VerifyUser
        def initialize(token)
        @token = token
        end
        def call
            decoded_token
            @decoded
        end
        private
        def decoded_token
                begin
                    @decoded = JWT.decode(@token, APP_CONFIG['jwt_secret'], true, algorithm: 'HS256')[0]['user']['email'].to_s
                rescue JWT::ExpiredSignature
                     nil
                rescue JWT::DecodeError
                     nil
                end
        end
    end
end