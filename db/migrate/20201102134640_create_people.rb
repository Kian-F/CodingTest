class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :Name
      t.string :Location
      t.String :Species
      t.string :Gender
      t.string :Affiliations
      t.string :Weapon
      t.string :Vehicle

      t.timestamps
    end
  end
end
