module LogService
    class CreateLog
        def initialize(service,domain,action,user_id,domain_id)
        @service =service
        @domain = domain
        @action = action
        @user_id = user_id
        @domain_id = domain_id
        end
        def call
            create_log
            @log
        
        end
        private
        def create_log
            @log = Log.create!({
                service = @service
                domain = @domain
                action = @action
                user_id = @user_id
                domain_id = @domain_id
            })
        end
        
    end
    
end