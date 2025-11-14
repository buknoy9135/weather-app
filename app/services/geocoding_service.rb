require "net/http"
require "json"

class GeocodingService
  BASE_URL = "https://geocoding-api.open-meteo.com/v1/search"

  def initialize(city)
    @city = city
  end

  def fetch
    url = URI("#{BASE_URL}?name=#{URI.encode_www_form_component(@city)}&count=5&language=en&format=json")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    data["results"] || []
  rescue StandardError => e
    { "error" => e.message }
  end
end
