require 'rails_helper'

describe UrlController do
  describe 'GET new' do
    let(:long_url) { 'https://google.com' }
    let(:short_url) { 'http://localhost:3000/345' }
    let(:url) { double('Url', id: 345) }
    let(:urls) {
      {
        original_url: long_url,
        short_url: short_url,
      }
    }

    before do
      allow(Url).to receive(:create).with(long_url: long_url).and_return(url)
    end

    context 'when passed a URL' do
      it 'returns the URL and a short URL as JSON' do
        get :new, long_url: long_url
        expect(response.body).to eql(urls.to_json)
      end
    end

    context 'when passed an invalid URL' do
      let(:error) { { error: "Invalid url" } }

      it 'returns JSON containing an error' do
        get :new, long_url: 'not a url'
        expect(response.body).to eql(error.to_json)
      end
    end
  end
end
