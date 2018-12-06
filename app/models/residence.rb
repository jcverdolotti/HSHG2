class Residence < ApplicationRecord
    has_many :weeks, dependent: :destroy
    #belongs_to :reservation
end
