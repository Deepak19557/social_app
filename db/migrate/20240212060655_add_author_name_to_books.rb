class AddAuthorNameToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :author_name, :string
  end
end
