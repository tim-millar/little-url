class UrlController < ApplicationController
  def new
    render json: urls
  end

  private

  def urls
    if long_url =~ valid_url
      {
        original_url: long_url,
        short_url: "http://localhost:3000/#{short_url}",
      }
    else
      { error: 'Invalid url' }
    end
  end

  def long_url
    request.original_fullpath[5..-1]
  end

  def valid_url
    /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def short_url
    Url.create(long_url: long_url).id
  end
end
