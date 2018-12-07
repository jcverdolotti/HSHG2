class Week < ApplicationRecord

    
    belongs_to :residence


    
    validates :residence_id, presence:true
    validates :week_date, presence:true
    
    scope :dosmeses,-> {where("week_date > ?", 6.months.from_now).limit(8)}
    scope :nodisponible,-> {where("week_date > ?", 0.month.from_now)}
   

end
