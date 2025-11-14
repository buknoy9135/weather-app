class AddTimeZoneAndPopulationToCities < ActiveRecord::Migration[7.2]
  def change
    add_column :cities, :timezone, :string
    add_column :cities, :population, :integer
  end
end
