class RenameFirstNameToFirst < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :First_Name, :First
  end
end
