class City < ApplicationRecord
  has_many  :forecasts, dependent: :destroy
  validates :name, :latitude, :longitude, :timezone, presence: true
  validates :population, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
