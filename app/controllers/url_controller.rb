class UrlController < ApplicationController
  def new
    render json: urls
  end

  private

  def urls
    if long_url =~ valid_url
      {
        original_url: long_url,
        short_url: 'http://localhost:3000/345',
      }
    else
      { error: 'Invalid url' }
    end
  end

  def long_url
    params[:long_url]
  end

  def valid_url
    /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
