class CreateEmailTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :email_templates do |t|
      t.text :content
      t.string :template_name

      t.timestamps
    end
  end
end
