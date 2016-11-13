require 'request_info'

describe RequestInfo do
  subject(:request_info) { RequestInfo.new(request) }

  let(:original_fullpath) { '/new/https://google.com' }
  let(:long_url) { 'https://google.com' }
  let(:base_url) { 'http://test.site' }
  let(:request) {
    double(
      'Request',
      original_fullpath: original_fullpath,
      base_url: base_url,
    )
  }

  describe '#long_url' do
    it 'returns the full url of the requested link' do
      expect(request_info.long_url).to eql(long_url)
    end
  end

  describe '#base_url' do
    it 'returns the url if the current site' do
      expect(request_info.base_url).to eql(base_url)
    end
  end

  describe '#valid_long_url?' do
    it 'checks whether the url of the requested site is valid' do
      expect(request_info.valid_long_url?).to be_truthy
    end
  end
end
