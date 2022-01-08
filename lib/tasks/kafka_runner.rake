desc "run kafka consumer"

task :kafka_runner => [:environment] do
    config = {
        :"bootstrap.servers" => APP_CONFIG['kafka_server'],
        :"group.id"          => APP_CONFIG['kafka_group_id'],

    }
    topic = APP_CONFIG['kafka_topic']
    rdkafka = Rdkafka::Config.new(config)
    consumer = rdkafka.consumer
    consumer.subscribe(topic)
    # # binding.irb
    begin
    consumer.each do |message|
        h = Hash.new
        h = eval(message.payload.to_s)
        # puts "Message received: #{h.fetch(:id)}"
        action = LogsHelper.create(h["service"],h["domain"],h['action'],h['actor'].to_i,h['domain_id'].to_i )
        Rails.logger.info "Hello #{message.payload.to_s}"
        #Rails.logger.info message.payload.to_s

      
    end
    rescue Rdkafka::RdkafkaError => e
    retry if e.is_partition_eof?
    raise
    end

end