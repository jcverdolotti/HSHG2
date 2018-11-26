class CreatePetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :petitions do |t|

      t.string :email
      t.integer :current_uType
      t.timestamps
    end
  end
end
