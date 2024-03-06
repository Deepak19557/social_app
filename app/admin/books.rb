ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :language, :author_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :language, :author_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # action_item :import_csv, only: :index do
  #   link_to 'Import CSV', action: 'import_csv'
  # end

  collection_action :import_csv do
    render 'admin/books/import_csv'
  end

  collection_action :process_import_csv, method: :post do
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

  controller do
    def update
      @book = Book.find(params[:id])
      @book.update(name: params[:book][:name], language: params[:book][:language], author_name: params[:book][:author_name])
      redirect_to admin_books_url
    end
  end
  
end
