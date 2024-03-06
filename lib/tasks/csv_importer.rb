require 'csv'

class CsvImporter
  def self.import_all
    import_book
    import_book100
  end

  def self.import_books
    csv_text = File.read(Rails.root.join('path/to/book.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Book.create!(row.to_hash)
    end
  end

  def self.import_authors
    csv_text = File.read(Rails.root.join('path/to/book100.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Book.create!(row.to_hash)
    end
  end

end
