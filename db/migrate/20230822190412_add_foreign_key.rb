class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :beers, :breweries, column: :brewery_id, primary_key: "id"
  end
end
