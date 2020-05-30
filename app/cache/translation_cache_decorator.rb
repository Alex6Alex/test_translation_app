class TranslationCacheDecorator
  CACHE_PREFIX = 'text_cache'.freeze
  DEFAULT_EXPIRE_TIME = 2.minutes

  def initialize(connection)
    @connection = connection
  end

  def translate(text:, language:)
    Rails.cache.fetch(cache_key(text, language), cache_options) do
      @connection.translate(text: text, language: language)
    end
  end

  private

  def cache_key(text, language)
    "#{CACHE_PREFIX}_#{text}_#{language}"
  end

  def cache_options
    { expires_in: DEFAULT_EXPIRE_TIME }
  end
end