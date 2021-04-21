class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :address, presence: true, length: { in: 6..300 }
end
