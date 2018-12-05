class Reservation < ApplicationRecord
    
    belongs_to :user
    has_one :residence
    has_one :week
    
end
