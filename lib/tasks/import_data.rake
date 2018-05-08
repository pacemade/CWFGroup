require 'csv'

desc "Import Sample Data"
task import_data: :environment do
  filename = File.join Rails.root, "sampleDataHenry2.csv"
  CSV.foreach(filename, :headers => true) do |row|
    company = Company.find_or_create_by(name: row[0])
  policy = Policy.new(min_age: row[1], max_age: row[2], "10,000": row[3], "25,000": row[4], "50,000": row[5], "75,000": row[6], "100,000": row[7])
  policy.company = company
  policy.save
  end
end
