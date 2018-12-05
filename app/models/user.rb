class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 	validates :card_SC, length: { is: 3 }
 	validates :card_number, length: { is: 16}
  validates :age, numericality: { greater_than: 18}
  validates :credits, inclusion: {in: 0..2}

  has_many :reservations, dependent: :destroy
end
