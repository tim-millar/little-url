class RedirectController < ApplicationController
  def index
    redirect_to long_url
  end

  private

  def long_url
    url.long_url
  end

  def url
    Url.find(short_url)
  end

  def short_url
    params[:short_url]
  end
end
