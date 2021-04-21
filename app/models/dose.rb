class Dose < ApplicationRecord
  belongs_to :medicine
  has_many :packs, dependent: :destroy
  has_many :orders
  validates_presence_of :weight
end
