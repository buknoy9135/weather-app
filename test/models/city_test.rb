require "test_helper"

class CityTest < ActiveSupport::TestCase
  test "valid city" do
    city = City.new(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )
    assert city.valid?
  end

  test "city needs a name" do
    city = City.new(
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )
    assert_not city.valid?
  end

  test "city needs latitude" do
    city = City.new(
      name: "Bacolod",
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )
    assert_not city.valid?
  end

  test "city needs longitude" do
    city = City.new(
      name: "Bacolod",
      latitude: 10.6770,
      timezone: "Asia/Manila"
    )
    assert_not city.valid?
  end

  test "city needs timezone" do
    city = City.new(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500
    )
    assert_not city.valid?
  end

  test "population can be empty" do
    city = City.new(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila",
      population: nil
    )
    assert city.valid?
  end
end
