require 'grpc'
require_relative '../pubs/users_services_pb'
class UserServer < Helloworld::Users::Service

    def get_user_by_id(get_user_req, _unused_call)
      user =User.find(get_user_req.id)
      
      if user
        Helloworld::GetUserReply.new(status: "success" ,user: {email: user.email ,name: user.name, id: user.id})
      else
        Helloworld::GetUserReply.new(status: "error"  ,error: {message: "not found"})
      end
    end    

    def get_user_by_token(get_user_by_token_req, _unused_call)
      email = UserService::VerifyUser.new(get_user_by_token_req.token).call
      user = UserService::GetUserByEmail.new(email).call
      puts user
      Helloworld::GetUserReply.new(status: "success" ,user: {email:user.email ,name: user.name, id: user.id})
    end
end
