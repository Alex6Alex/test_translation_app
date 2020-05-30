require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  include ActiveSupport::Testing::TimeHelpers

  let(:news) { News.create(title: 'Test news', text: 'Text of test news') }

  describe '#show' do
    let(:expected_response) do
      {
        'id' => news.id,
        'title' => 'Test news',
        'text' => 'Text of test news',
        'created_at' => '2020-05-28 09:00:00 UTC'
      }
    end

    context 'when language for translation was not set' do
      it 'return news entity with text in original language' do
        travel_to(Time.new(2020, 5, 28, 12)) do
          get(:show, params: { id: news.id })

          expect(JSON.parse(response.body)).to eq(expected_response)
        end
      end
    end

    context 'when language for translation was set' do
      it 'returns news entity with translated text' do
        travel_to(Time.new(2020, 5, 28, 12)) do
          expect_any_instance_of(TranslationCacheDecorator).to receive(
            :translate
          ).and_return('Translated text')

          get(:show, params: { id: news.id, lang: 'en' })

          expect(JSON.parse(response.body)).to eq(
            expected_response.merge('text' => 'Translated text')
          )
        end
      end
    end

    context 'when some exceptions was raised' do
      it 'returns error answer' do
        get(:show, params: { id: -1 })

        expect(JSON.parse(response.body)).to eq(
          'error' => true, 'message' => "Couldn't find News with 'id'=-1"
        )
      end
    end
  end
end