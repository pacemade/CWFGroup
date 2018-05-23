class AddTripDurationColumnToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :trip_duration, :integer
  end
end
