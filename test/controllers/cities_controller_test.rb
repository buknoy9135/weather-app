require "test_helper"

class CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cities_path
    assert_response :success
  end

  test "should show city" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    get city_path(city)
    assert_response :success
  end

  test "should create city" do
    assert_difference("City.count", 1) do
      post cities_path, params: {
        city: {
          name: "Manila",
          country: "Philippines",
          latitude: 14.5995,
          longitude: 120.9842,
          timezone: "Asia/Manila",
          population: 1780000
        }
      }
    end

    assert_redirected_to city_path(City.last)
  end

  test "should destroy city" do
    city = City.create!(
      name: "Bacolod",
      latitude: 10.6770,
      longitude: 122.9500,
      timezone: "Asia/Manila"
    )

    assert_difference("City.count", -1) do
      delete city_path(city)
    end

    assert_redirected_to cities_path
  end

  test "should not create city without name" do
    assert_no_difference("City.count") do
      post cities_path, params: {
        city: {
          latitude: 10.6770,
          longitude: 122.9500,
          timezone: "Asia/Manila"
        }
      }
    end
  end
end
