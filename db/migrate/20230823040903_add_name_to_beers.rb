class AddNameToBeers < ActiveRecord::Migration[7.0]
  def change
    add_column :beers, :name, :string
  end
end
