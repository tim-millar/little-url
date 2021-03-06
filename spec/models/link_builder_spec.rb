require 'rails_helper'

describe LinkBuilder do
  describe '#as_json' do
    subject(:link_builder) { LinkBuilder.new(request_info) }

    let(:base_url) { 'http://test.host' }
    let(:url) { double('Url', id: 123) }
    let(:long_url) { 'https://metafilter.com' }
    let(:valid_long_url?) { true }
    let(:as_json) {
      {
        original_url: long_url,
        short_url: base_url + '/123',
      }
    }

    let(:request_info) {
      double(
        'RequestInfo',
        long_url: long_url,
        base_url: base_url,
        valid_long_url?: valid_long_url?,
      )
    }

    before do
      allow(Url).to receive(:create).with(long_url: long_url).
        and_return(url)
    end


    it 'returns the original and shortened urls as a hash' do
      expect(link_builder.as_json).to eql(as_json)
    end

    context 'when the original url is invalid' do
      let(:long_url) { 'an.invalid.url' }
      let(:valid_long_url?) { false }
      let(:error) { { error: 'Invalid url' } }

      it 'returns an error hash' do
        expect(link_builder.as_json).to eql(error)
      end
    end
  end
end
