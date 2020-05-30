module YandexTranslation
  module Responses
    class Translate
      SUCCESS_RESPONSE_CODE = 200

      def initialize(response)
        @response = response
      end

      def contains_error?
        parsed_response['code'].to_i != SUCCESS_RESPONSE_CODE
      end

      def text
        parsed_response['text'].first
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(@response)
      end
    end
  end
end
