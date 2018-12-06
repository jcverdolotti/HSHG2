class Week < ApplicationRecord

    
    belongs_to :residence


    
    validates :residence_id, presence:true
    validates :weekDate, presence:true
    
    scope :dosmeses,-> {order(:weekDate).limit(8)}

end
