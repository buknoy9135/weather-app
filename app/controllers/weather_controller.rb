class WeatherController < ApplicationController
  def search; end

  def result
    if params[:city].present?
      service = GeocodingService.new(params[:city])
      @results = service.fetch
    else
      @results = []
    end
  end
end
