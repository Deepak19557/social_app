class BooksController < ApplicationController
	def create
		@book = Book.create(name: params[:name], language: params[:language], author_name: params[:author_name])
		redirect_to books_path
	end

	def download_csv
		require 'csv'
		data = generate_csv_data
		send_data data, filename: "Book.csv"
	end

	def delete_all_book
		Book.destroy_all
		redirect_to books_path, notice: "Deleted"
	end

	def import_csv
		Book.import(params[:file])
		redirect_to books_path, notice: "Book Data imported"
	end

	def index
		@books = params[:language].present? ? Book.where(language: params[:language]) : Book.all
		# @books = Book.paginate(page: params[:page], per_page: 5)
		# @books1 = @books.paginate(params[:page]).per(5)
	end

  def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to books_path
	end

	def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
   	respond_to do |format|
      format.html { redirect_to ponies_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
   	end
	end

	def process_import_csv
    if params[:csv_file].present?
      csv_text = params[:csv_file].read
      csv = CSV.parse(csv_text, headers: true)

      csv.each do |row|
        Book.create!(row.to_hash)
      end

      redirect_to admin_books_path, notice: "CSV file imported successfully."
    else
      redirect_to admin_books_path, alert: "No CSV file selected."
    end
  end

	def download_pdf
	 @book = Book.last
	 @books = Book.all
	 respond_to do |format|
		 format.html
		 format.pdf do
			 @pdf = render_to_string pdf: "Book #{@book.name}", template: "books/download_pdf", encoding: "UTF-8", formats: [:html]
			 send_data(@pdf, filename: "#{@book.name}.pdf", type: "application/pdf", disposition: 'attachment')
		 end
	 end
	end


	private

	def book_params
		params.require(:book).permit(:language, :name, :author_name)
	end

  def generate_csv_data
    CSV.generate do |csv|
      csv << ["Book Name", "Language", "Author Name"]
			Book.all.each do |book|
      	csv << [book.name, book.language, book.author_name]
			end
    end
  end
end
