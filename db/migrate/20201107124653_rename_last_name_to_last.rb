class RenameLastNameToLast < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :Last_Name, :Last

  end
end
