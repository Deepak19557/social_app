class CsvJob < ApplicationJob
  queue_as :default

  def perform(file)
    csv_data = file.read
    CSV.parse(csv_data, headers: true) do |row|
      f = Food.find_or_initialize_by (row.to_hash)
      f.save!
    end
  end
end
