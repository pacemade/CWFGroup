class IncreaseIntegerScale < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :credit_card_number, :integer, limit: 8
  end
end
