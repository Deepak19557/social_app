ActiveAdmin.register Author do
  permit_params :name, :language, :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :number
      f.input :email
      f.input :image, as: :file
    end
    f.actions
  end

  action_item :show_custom_button, only: :show do
    link_to 'Back', admin_email_templates_path
  end

  action_item :edit_custom_button, only: :edit do
    link_to 'Back', admin_email_templates_path
  end

  index do
    selectable_column
    id_column
    column :name
    column :number
    column :email
    actions
  end

  collection_action :download_csv1, method: :post do
    require 'csv'
    data = CSV.generate do |csv|
      csv << ["Book Name", "Language", "Author Name"]
      Author.all.each do |author|
        csv << [author.name, author.number, author.email]
      end
    end
    send_data data, filename: "Author.csv"
  end

  action_item :download_csv1, only: :index do
    link_to 'Download_CSV', download_csv1_admin_authors_path, method: :post
  end







end