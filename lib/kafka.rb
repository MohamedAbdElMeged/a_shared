class Kafka
    attr_reader :config , :topic , :payload , :key, :kafka
    def initialize
        config = {
        :"bootstrap.servers" => APP_CONFIG['kafka_server'] 
        }
        @kafka =  Rdkafka::Config.new(config)
    end
    def produce_message(topic,payload,key)
    producer = @kafka.producer
    producer.produce(topic: topic ,payload: payload.to_s, key: key.to_s).wait
    puts "sent Successfully!"
    end 
    
end

