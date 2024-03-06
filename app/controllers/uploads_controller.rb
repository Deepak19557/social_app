class UploadsController < ApplicationController
  def new
  end

  def process_uploads
    import_books(params[:books_csv]) if params[:books_csv]
    import_authors(params[:authors_csv]) if params[:authors_csv]
    redirect_to root_path, notice: "CSV files imported successfully."
  end

  def download_author_csv
  	require 'csv'
		data = generate_csv_data
		send_data data, filename: "Author.csv"
  end

  def download_author_pdf
   	@author = Author.first
	 	@authors = Author.all
	 	respond_to do |format|
			format.html
			format.pdf do
				@pdf = render_to_string pdf: "Author #{@author.name}", template: "uploads/download_author_pdf", encoding: "UTF-8", formats: [:html]
			 	send_data(@pdf, filename: "#{@author.name}.pdf", type: "application/pdf", disposition: 'attachment')
		 	end
	 	end
  end

  private

  def import_books(csv_file)
    csv_text = csv_file.read
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Book.create!(row.to_hash)
    end
  end

  def import_authors(csv_file)
    csv_text = csv_file.read
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Author.create!(row.to_hash)
    end
  end

  def generate_csv_data
    CSV.generate do |csv|
      csv << ["ID", "Name", "Number"]
			Author.all.each do |author|
      	csv << [author.id, author.name, author.number]
			end
    end
  end

end
