module YandexTranslation
  class Connection
    def initialize
      @configuration = YandexTranslation::Configuration.new
      @client = YandexTranslation::Client.new(@configuration)
    end

    def translate(text:, language:)
      request = YandexTranslation::Requests::Translate.new(@configuration)

      raw_response = @client.send_request(
        request_data: request.build(text: text, language: language)
      )
      response = YandexTranslation::Responses::Translate.new(raw_response)
      raise(TranslationError.build) if response.contains_error?

      response.text
    end
  end
end
