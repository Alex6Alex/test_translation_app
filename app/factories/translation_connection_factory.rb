class TranslationConnectionFactory
  def self.build
    YandexTranslation::Connection.new
  end
end
