class CreateForecasts < ActiveRecord::Migration[7.2]
  def change
    create_table :forecasts do |t|
      t.references :city, null: false, foreign_key: true
      t.float :temperature
      t.float :humidity
      t.integer :is_day
      t.integer :weather_code
      t.float :windspeed
      t.datetime :time_updated
      t.datetime :fetched_at

      t.timestamps
    end
  end
end
