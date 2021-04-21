class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :name, :mobile_number
  validates :mobile_number, length: { is: 10 }
  has_many :addresses
  has_many :cards
  has_many :orders

  
end
