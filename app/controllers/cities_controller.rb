class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def create
    @city = City.find_or_create_by(city_params)

    if @city.persisted?
      weather_data = WeatherService.new(@city).fetch

      if weather_data.present? && weather_data["error"].blank?
        Forecast.create!(
          city: @city,
          temperature: weather_data["temperature_2m"],
          humidity: weather_data["relative_humidity_2m"],
          is_day: weather_data["is_day"],
          weather_code: weather_data["weather_code"],
          windspeed: weather_data["wind_speed_10m"],
          time_updated: weather_data["time"],
          fetched_at: Time.now
        )
      end

      redirect_to @city, notice: "#{@city.name} saved with current weather!"
    else
      redirect_to weather_search_path, alert: "Failed to save city."
    end
  end

  def show
    @city = City.find(params[:id])
    @forecasts = @city.forecasts.order(fetched_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path, notice: "City #{@city.name} deleted"
  end

  private

  def city_params
    params.require(:city).permit(:name, :country, :latitude, :longitude, :timezone, :population)
  end
end
