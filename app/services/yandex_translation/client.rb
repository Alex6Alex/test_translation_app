module YandexTranslation
  class Client
    def initialize(configuration)
      @configuration = configuration
    end

    def send_request(request_data:)
      Net::HTTP.post_form(@configuration.url, request_data).body
    end
  end
end
