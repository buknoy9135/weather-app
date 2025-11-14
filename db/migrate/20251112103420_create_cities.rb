class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
