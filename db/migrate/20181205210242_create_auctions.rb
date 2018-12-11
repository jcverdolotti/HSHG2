class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.integer :user_id
      t.integer :residence_id
      t.decimal :minBid
      t.decimal :startPrice
      t.decimal :price
      t.date :startDate
      t.integer :week_id
      t.decimal :bid
      t.date :endDate
      t.boolean :started, default: false
      
      t.timestamps
    end
  end
end
