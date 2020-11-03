class CreateAffiliations < ActiveRecord::Migration[6.0]
  def change
    create_table :affiliations, :id => false do |t|
      t.string :Affiliation
      t.integer :id

      t.timestamps
    end
  end
end
