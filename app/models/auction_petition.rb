class AuctionPetition < ApplicationRecord
    
    validates :email, presence: true
    validates :residence_id, presence: true

end
