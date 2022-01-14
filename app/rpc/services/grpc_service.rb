class GrpcService
    require 'grpc'
    require_relative '../pubs/users_services_pb'
    def initialize
        s = GRPC::RpcServer.new(pool_size: 5)
        s.add_http2_port('localhost:50057', :this_port_is_insecure)
        s.handle(UserServer)
        
        # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to 
        #   gracefully shutdown.
        # User could also choose to run server via call to run_till_terminated
        s.run_till_terminated
    end
end