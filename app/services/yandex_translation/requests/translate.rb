module YandexTranslation
  module Requests
    class Translate
      def initialize(configuration)
        @configuration = configuration
      end

      def build(text:, language:)
        { key: @configuration.key, lang: "ru-#{language}", text: text }
      end
    end
  end
end