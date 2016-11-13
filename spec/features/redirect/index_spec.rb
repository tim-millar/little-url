require 'rails_helper'

describe 'index redirects', type: :request do
  let(:long_url) { 'https://google.com' }
  let(:url) { Url.create(long_url: long_url) }
  let(:url_id) { url.id }

  it 'redirects to a short url' do
    get "/#{url_id}"

    expect(response).to redirect_to(long_url)
  end
end
