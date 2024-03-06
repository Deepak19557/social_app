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
end