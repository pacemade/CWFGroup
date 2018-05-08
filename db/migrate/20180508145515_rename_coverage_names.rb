class RenameCoverageNames < ActiveRecord::Migration[5.1]
  def up
    rename_column :policies, :cov_10k, :"10,000"
    rename_column :policies, :cov_25k, :"25,000"
    rename_column :policies, :cov_50k, :"50,000"
    rename_column :policies, :cov_75k, :"75,000"
    rename_column :policies, :cov_100k, :"100,000"
  end
  def down
    rename_column :policies, :"10,000", :cov_10k
    rename_column :policies, :"25,000", :cov_25k
    rename_column :policies, :"50,000", :cov_50k
    rename_column :policies, :"75,000", :cov_75k
    rename_column :policies, :"100,000", :cov_100k
  end
end
