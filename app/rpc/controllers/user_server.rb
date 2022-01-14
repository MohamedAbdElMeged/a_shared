require 'grpc'
require_relative '../pubs/users_services_pb'
class UserServer < Helloworld::Users::Service

    def get_user_by_id(get_user_req, _unused_call)
      user =User.find(get_user_req.id)
      Helloworld::GetUserReply.new(email: user.email , name: user.name, id: user.id)
    end    
end
