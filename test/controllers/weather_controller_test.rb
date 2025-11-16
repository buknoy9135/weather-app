require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get search page" do
    get weather_search_path
    assert_response :success
  end

  test "should get result with city param" do
    get weather_result_path, params: { city: "Bacolod" }
    assert_response :success
  end
end
