class CreatePolicies < ActiveRecord::Migration[5.1]
  def change
    create_table :policies do |t|
      t.integer :min_age
      t.integer :max_age
      t.decimal :cov_10k, :precision => 15, :scale => 10
      t.decimal :cov_25k, :precision => 15, :scale => 10
      t.decimal :cov_50k, :precision => 15, :scale => 10
      t.decimal :cov_75k, :precision => 15, :scale => 10
      t.decimal :cov_100k, :precision => 15, :scale => 10

      t.timestamps
    end
  end
end
