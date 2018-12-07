class CreateHotsales < ActiveRecord::Migration[5.1]
  def change
    create_table :hotsales do |t|

      t.integer :residence_id
      t.integer :week_id

      t.timestamps
    end
  end
end
