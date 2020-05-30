class TranslationError < StandardError
  def self.build
    new('Translation connection returns error')
  end
end