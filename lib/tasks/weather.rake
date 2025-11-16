namespace :weather do
  desc "Fetch weather for all saved cities"
  task fetch: :environment do
    City.find_each do |city|
      begin
        weather_data = WeatherService.new(city).fetch
        next if weather_data.blank? || weather_data["error"].present?

        Forecast.create!(
          city: city,
          temperature: weather_data["temperature_2m"],
          humidity: weather_data["relative_humidity_2m"],
          is_day: weather_data["is_day"],
          weather_code: weather_data["weather_code"],
          windspeed: weather_data["wind_speed_10m"],
          time_updated: weather_data["time"],
          fetched_at: Time.current
        )

        puts "Weather for #{city.name} saved."

      rescue => e
        puts "Error on #{city.name}: #{e.class} - #{e.message}"
        puts e.backtrace.first
      end
    end
  end
end
