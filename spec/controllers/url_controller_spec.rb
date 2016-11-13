require 'rails_helper'

describe UrlController do
  describe 'GET new' do
    let(:long_url) { 'https://google.com' }
    let(:short_url) { 'http://test.host/345' }
    let(:link_builder) { double('LinkBuilder', as_json: urls) }
    let(:request_info) { double('RequestInfo') }
    let(:urls) {
      {
        original_url: long_url,
        short_url: short_url,
      }
    }

    before do
      allow(LinkBuilder).to receive(:new).with(request_info).
        and_return(link_builder)
      allow(RequestInfo).to receive(:new).with(controller.request).
        and_return(request_info)
    end

    context 'when passed a URL' do
      it 'returns the URL and a short URL as JSON' do
        get :new, long_url: long_url
        expect(response.body).to eql(urls.to_json)
      end
    end

    context 'when passed an invalid URL' do
      let(:urls) { { error: 'Invalid url' } }

      it 'returns JSON containing an error' do
        get :new, long_url: 'not a url'
        expect(response.body).to eql(urls.to_json)
      end
    end
  end
end
