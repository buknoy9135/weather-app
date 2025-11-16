require "test_helper"

class ForecastTest < ActiveSupport::TestCase
  test "valid forecast" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert forecast.valid?
  end

  test "forecast needs a city" do
    forecast = Forecast.new(
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs temperature" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs humidity" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs windspeed" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs weather_code" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      is_day: 1,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs is_day" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      time_updated: Time.current,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs time_updated" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      fetched_at: Time.current
    )
    assert_not forecast.valid?
  end

  test "forecast needs fetched_at" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    forecast = Forecast.new(
      city: city,
      temperature: 28.5,
      humidity: 75,
      windspeed: 12.0,
      weather_code: 0,
      is_day: 1,
      time_updated: Time.current
    )
    assert_not forecast.valid?
  end
end
