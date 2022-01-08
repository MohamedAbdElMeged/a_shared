class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:current_user,:logout]
    before_action :logged_in_user , only: [:current_user,:logout]

    def sign_up
        user = UsersHelper.register_user(user_params)
        render "create",locals: {user: user}
    end
    def sign_in
        user = AuthHelper.sign_in(params[:email],params[:password])
        if user != nil 
             render "create",locals: {user: user} 
        else 
            render json: "Invalid Cred."
        end
    end
    def current_user
        render "create",locals: {user: @user}
    end
    def logout
        @user.auth_token = nil
        render json: "logout out succussfully"
    end
    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)   
    end
end
