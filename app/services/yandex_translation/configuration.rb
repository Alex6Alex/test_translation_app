module YandexTranslation
  class Configuration
    def url
      URI(ENV['YANDEX_TRANSLATION_API_URL'])
    end

    def key
      ENV['YANDEX_TRANSLATION_API_KEY']
    end
  end
end