ActiveAdmin.register EmailTemplate do
  permit_params :template_name, :content



  

  form do |f|
    f.inputs do
      f.input :template_name
      f.input :content, as: :quill_editor
      # f.input :content, as: :ckeditor
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
    column :template_name
    column :content
    actions
  end

  show do
    attributes_table do
      row :template_name
      row :content
      row :created_at
      row :updated_at
    end
  end


  controller do
    def new
      super
    end
  end

end