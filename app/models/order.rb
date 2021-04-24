class Order < ApplicationRecord
  belongs_to :user
  belongs_to :medicine
  belongs_to :dose
  belongs_to :pack
  belongs_to :address
  belongs_to :card , required: false
  validates_presence_of :payment_method
 

end
