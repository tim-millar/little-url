require 'rails_helper'

describe Url, type: :model do
  subject(:url) { Url.new(long_url: long_url) }
  let(:long_url) { 'https://google.com' }

  describe '#create_urls' do
    it 'creates a hash containg long and short urls' do
      expect(url.create_urls).to eql(urls)
    end
  end
end
