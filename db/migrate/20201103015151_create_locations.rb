class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations, :id => false do |t|
      t.string :Location
      t.integer :id

      t.timestamps
    end
  end
end
