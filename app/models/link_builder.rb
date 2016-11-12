class LinkBuilder
  attr_reader :request

  def initialize(request)
    @request = request
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
    long_url =~ valid_url
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
    request.original_fullpath[5..-1]
  end

  def valid_url
    /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def short_url
    base_url + '/' + url_id
  end

  def base_url
    request.base_url
  end

  def url_id
    url.id.to_s
  end

  def url
    Url.create(long_url: long_url)
  end
end
