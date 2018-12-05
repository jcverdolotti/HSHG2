class CreateAuctionPetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :auction_petitions do |t|
      t.string :email
      t.timestamps
    end
  end
end
