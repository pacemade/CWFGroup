class AddReferenceToPolicies < ActiveRecord::Migration[5.1]
  def change
    add_reference :policies, :company, foreign_key: true
  end
end
