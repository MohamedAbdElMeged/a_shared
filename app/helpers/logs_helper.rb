module LogsHelper
    class << self
        def create(service,domain,action,user_id,domain_id)
            log = Log.new
            log.service = service
            log.domain = domain
            log.action = action
            log.user_id = user_id
            log.domain_id = domain_id
            log.save!
            puts "save log successfully!"
        end
    end   
    
end