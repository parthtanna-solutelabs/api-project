class Pack < ApplicationRecord
  belongs_to :dose
  has_many :orders
  validates_presence_of :size, :price
end
