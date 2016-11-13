require 'request_info'

class LinkBuilder
  attr_reader :request_info
  private :request_info

  def initialize(request_info)
    @request_info = request_info
  end

  def as_json(options={})
    if valid_url?
      links
    else
      error
    end
  end

  private

  def valid_url?
    request_info.valid_long_url?
  end

  def links
    {
      original_url: long_url,
      short_url: short_url,
    }
  end

  def error
    { error: 'Invalid url' }
  end

  def long_url
    request_info.long_url
  end

  def short_url
    request_info.base_url + "/#{url.id}"
  end

  def url
    Url.create(long_url: long_url)
  end
end
