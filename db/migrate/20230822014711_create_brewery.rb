class CreateBrewery < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.integer :total_taps
      t.boolean :allow_dogs

      t.timestamps
    end
  end
end
