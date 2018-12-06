class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :residence_id
      t.integer :week_id
      t.timestamps
    end
  end
end
