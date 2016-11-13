class UrlController < ApplicationController
  def new
    render json: link_builder
  end

  private

  def link_builder
    LinkBuilder.new(request_info)
  end

  def request_info
    RequestInfo.new(request)
  end
end
