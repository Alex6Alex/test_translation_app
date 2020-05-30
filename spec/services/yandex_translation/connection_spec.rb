require 'rails_helper'

RSpec.describe YandexTranslation::Connection do
  subject(:connection) { described_class.new }

  describe '#translate' do
    context 'when response contains error message' do
      it 'raises error' do
        stub_translation_request(code: 401, message: 'Some error')

        expect do
          connection.translate(text: 'Some text', language: 'en')
        end.to raise_error(TranslationError)
      end
    end

    context 'when response contains translated text' do
      it 'returns translated test' do
        stub_translation_request(
          code: 200,
          lang: 'en-ru',
          text: ['Translated text']
        )

        expect(connection.translate(text: 'Some text', language: 'en')).to eq(
          'Translated text'
        )
      end
    end
  end

  def stub_translation_request(request_body)
    stub_request(:post, ENV['YANDEX_TRANSLATION_API_URL'])
      .to_return(body: request_body.to_json)
  end
end
