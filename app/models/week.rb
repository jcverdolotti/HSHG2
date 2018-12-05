class Week < ApplicationRecord

    scope :dosmeses,-> {order(weekDate:).limit(8)}

    belongs_to :residence
    
    validates :residence_id, presence:true
    validates :weekDate, presence:true


end