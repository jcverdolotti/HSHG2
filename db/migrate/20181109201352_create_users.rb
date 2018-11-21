class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
  
      t.string :password
      t.string :genre
      t.integer :age
      t.string :card_number
      t.string :card_SC
      t.date :card_expDate
      t.integer :user_type

      t.timestamps
    end
  end
end
