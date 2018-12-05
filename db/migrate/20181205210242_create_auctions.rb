class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.integer :user_id
      t.decimal :minBid
      t.decimal :startPrice
      t.decimal :price
      t.date :startDate
      t.date :endDate
      t.timestamps
    end
  end
end
