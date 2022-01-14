class ApplicationController < ActionController::API
    def auth_header
        request.headers["authorization"].split(' ')[1]
    end
    def logged_in_user
            email = UserService::VerifyUser.new(auth_header).call
            @user = UserService::GetUserByEmail.new(email).call
    end
    def logged_in?
        !!logged_in_user  
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless  logged_in? 
      end
end
