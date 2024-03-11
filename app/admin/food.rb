ActiveAdmin.register Food do
  permit_params :name

  collection_action :upload_csv, method: :post do
    if params[:file].present?
      time = 1.minute.from_now
      CsvJob.set(wait_until: time).perform_now(params[:file])
      redirect_to admin_foods_path, notice: "CSV uploaded and processed."
    else
      redirect_to admin_foods_path, alert: "Please select a CSV file to upload."
    end
  end

  action_item :upload_csv, only: :index do
    link_to 'Upload CSV', action: :upload_csv_button
  end

  collection_action :upload_csv_button, title: "Upload CSV" do
    render "admin/foods/upload_csv"
  end

  form do |f|
    f.inputs "Foods Details" do
      f.input :images,as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  controller do

    def new
      @food = Food.new
    end

    def edit
      @food = Food.new
    end

    def create
      files =  params[:food][:images].compact_blank!
      files.each do |file|
        CSV.foreach(file.path, headers: true){ |row| (Food.find_or_initialize_by row.to_hash).save }
      end
      redirect_to admin_foods_path, notice: "Please select a CSV file to upload."
    end

  end

end


