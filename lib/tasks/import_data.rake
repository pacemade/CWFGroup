require 'csv'

desc "Import Sample Data"
task import_data: :environment do
  filename = File.join Rails.root, "sampleDataHenry2.csv"
  CSV.foreach(filename, :headers => true) do |row|
    company = Company.find_or_create_by(name: row[0])
  policy = Policy.new(copies: row[7])
  policy.company = company
  policy.save
  end
end
