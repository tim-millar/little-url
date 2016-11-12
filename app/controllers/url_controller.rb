class UrlController < ApplicationController
  def new
    render json: link_builder
  end

  private

  def link_builder
    LinkBuilder.new(request)
  end
end
