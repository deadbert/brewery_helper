class CreateBeer < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :type
      t.boolean :on_tap
      t.float :pint_price
      t.integer :brewery_id

      t.timestamps
    end
  end
end
