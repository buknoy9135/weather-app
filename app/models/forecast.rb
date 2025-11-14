class Forecast < ApplicationRecord
  belongs_to :city
  validates :temperature, :humidity, :is_day, :weather_code, :windspeed, :time_updated, :fetched_at, presence: true
end
