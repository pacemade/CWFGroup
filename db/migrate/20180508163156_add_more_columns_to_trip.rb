class AddMoreColumnsToTrip < ActiveRecord::Migration[5.1]
  def up
    add_column :trips, :number_of_days, :integer
    add_column :trips, :rate_per_day, :decimal, precision: 15, scale: 10
  end
  
  def down
    remove_column :trips, :number_of_days
    remove_column :trips, :rate_per_day
  end
end
