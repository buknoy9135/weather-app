require "net/http"
require "json"

class WeatherService
  BASE_URL = "https://api.open-meteo.com/v1/forecast"

  def initialize(city)
    @city = city
  end

  def fetch
    url = URI("#{BASE_URL}?latitude=#{@city.latitude}&longitude=#{@city.longitude}&current=temperature_2m,relative_humidity_2m,is_day,weather_code,wind_speed_10m&timezone=auto")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    data["current"] || {}
  rescue StandardError => e
    { "error" => e.message }
  end
end
