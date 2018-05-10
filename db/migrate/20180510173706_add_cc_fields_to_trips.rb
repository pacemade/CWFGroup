class AddCcFieldsToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :credit_card_number, :integer
    add_column :trips, :cvv, :integer
    add_column :trips, :expiry_date, :datetime
  end
end
