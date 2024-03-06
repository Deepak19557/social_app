class ChangeNumberDataTypeToAuthors < ActiveRecord::Migration[7.1]
  def up
    change_column :authors, :number, :bigint
  end

  def down
    change_column :authors, :number, :int
  end
end
