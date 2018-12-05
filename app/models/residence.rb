class Residence < ApplicationRecord
    has_many :weeks, dependent: :destroy
end
