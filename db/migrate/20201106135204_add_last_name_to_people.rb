class AddLastNameToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :Last_Name, :string
  end
end
