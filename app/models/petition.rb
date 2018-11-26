class Petition < ApplicationRecord

	validates :email, presence: true
	validates :current_uType, presence: true
end
