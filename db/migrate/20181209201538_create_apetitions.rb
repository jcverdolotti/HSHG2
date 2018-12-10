class CreateApetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :apetitions do |t|
      t.integer :residence_id
      t.integer :week_id
      t.string :email
      t.timestamps
    end
  end
end
