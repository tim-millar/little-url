class RequestInfo
  attr_reader :request
  private :request

  def initialize(request)
    @request = request
  end

  def long_url
    request.original_fullpath[5..-1]
  end

  def base_url
    request.base_url
  end

  def valid_long_url?
    long_url =~ valid_url
  end

  private

  def valid_url
    /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
