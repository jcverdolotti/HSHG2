class CreateUserTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_types do |t|
      t.string :userType, default: "2"
      

      t.timestamps
    end
  end
end
