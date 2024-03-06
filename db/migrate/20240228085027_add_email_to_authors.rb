class AddEmailToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :email, :string
  end
end
