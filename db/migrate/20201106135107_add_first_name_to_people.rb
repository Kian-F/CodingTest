class AddFirstNameToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :First_Name, :string
  end
end
