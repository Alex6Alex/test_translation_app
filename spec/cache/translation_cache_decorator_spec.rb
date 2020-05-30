require 'rails_helper'

RSpec.describe TranslationCacheDecorator do
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    Rails.cache.clear
  end

  describe '#translate' do
    context 'when cache with text does not exist' do
      it 'saves cache at first' do
        params = { text: 'text', language: 'en' }

        connection = double('Connection', translate: 'some text')
        expect(connection).to receive(:translate).once.and_return('some text')

        cache_decorator = described_class.new(connection)

        expect(cache_decorator.translate(params)).to eq('some text')
        expect(cache_decorator.translate(params)).to eq('some text')
      end
    end
  end
end