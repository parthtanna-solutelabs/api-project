class Card < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates_presence_of :expiry_date, :card_number
  validates :card_number, length: { is: 16 }, uniqueness: true
end
