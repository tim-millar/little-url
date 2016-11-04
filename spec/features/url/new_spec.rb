require 'rails_helper'

describe 'new short urls', type: :request do
  it 'shortens a given url' do
    get '/new/https://google.com'

    expect(response.body).to contain('original_url')
    expect(response.body).to contain('short_url')
  end
end
