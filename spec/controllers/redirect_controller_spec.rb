require 'rails_helper'

describe RedirectController do
  describe 'GET index' do
    let(:short_url) { '123' }
    let(:long_url) { 'https://gooogle.com' }
    let(:url) { double('Url', long_url: long_url) }

    before do
      allow(Url).to receive(:find).with(short_url).and_return(url)
    end


    it "redirects to the short_url's long_url" do
      get :index, short_url: short_url
      expect(response).to redirect_to(long_url)
    end
  end
end
