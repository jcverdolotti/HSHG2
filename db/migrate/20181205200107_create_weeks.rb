class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|

      t.boolean :reserved, default: false
      t.integer :residence_id
      t.date :weekDate
      t.timestamps
      
    end
  end
end
