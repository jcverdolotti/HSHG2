class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :name
      t.string :location
      t.string :description
      t.date :date
      t.decimal :cost
      t.integer :people_amount
      t.string :logic_delete
      t.boolean :reserved

      t.timestamps
    end
  end
end
