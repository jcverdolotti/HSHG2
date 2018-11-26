class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 	validates :card_SC, length: { is: 3 }
 	validates :card_number, length: { is: 16}
 	validates :age, inclusion: { in: 18..99 }
end
