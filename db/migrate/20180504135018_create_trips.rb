class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :birthday
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
