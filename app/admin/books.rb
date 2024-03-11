ActiveAdmin.register Book do
  permit_params :name, :language, :author_name, media:[]  

  form do |f|
    f.inputs do
      f.input :name
      f.input :language
      f.input :author_name
      f.input :media, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

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
  filter :name

  collection_action :download_pdf1, method: :post do
    @books = Book.all
    respond_to do |format|
      format.html
      format.pdf do
        @pdf = render_to_string pdf: "book_pdf", locals: { books: @books }, layout: "pdf", template: "admin/books/download_pdf1", encoding: "UTF-8", formats: [:html]
        send_data(@pdf, filename: "#{Book.last.name}.pdf", type: "application/pdf", disposition: 'attachment')
      end
    end
  end

  action_item :downlodffdfdfdfad_pdf, only: :index do
    link_to 'Download PDF', download_pdf1_admin_books_path(format: :pdf), data: { turbo: false }, method: :post
  end





  # member_action :publish do
  #   # Custom action code here
  #   redirect_to admin_books_path, notice: "Book published!"
  # end

  # action_item :publish, only: :show do
  #   link_to "Publish", publish_admin_book_path(post), method: :put
  # end


  form do |f|
    f.inputs "Book Details" do
      f.input :name
      f.input :author_name
      f.input :language, as: :text
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :language
    column :author_name
    actions
  end


  action_item :show_custom_button, only: :show do
    link_to 'Back', admin_books_path
  end

  action_item :edit_custom_button, only: :edit do
    link_to 'Back', admin_books_path
  end


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
