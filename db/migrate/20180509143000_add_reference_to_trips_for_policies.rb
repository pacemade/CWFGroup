class AddReferenceToTripsForPolicies < ActiveRecord::Migration[5.1]
  def change
      add_reference :trips, :policy, foreign_key: true
  end
end
