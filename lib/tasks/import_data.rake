require 'csv'

desc "Import Sample Data"
task import_data: :environment do
  filename = File.join Rails.root, "sampleDataHenry2.csv"
  CSV.foreach(filename, :headers => true) do |row|
    company = Company.find_or_create_by(name: row[0])
  policy = Policy.new(min_age: row[1], max_age: row[2], cov_10k: row[3], cov_25k: row[4], cov_50k: row[5], cov_75k: row[6], cov_100k: row[7])
  policy.company = company
  policy.save
  end
end
