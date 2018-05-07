class AddCoverageColumnToTrips < ActiveRecord::Migration[5.1]
  def up
    add_column :trips, :coverage, :string
  end

  def down
    remove_column :trips, :coverage
  end
end
