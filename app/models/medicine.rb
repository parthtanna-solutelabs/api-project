class Medicine < ApplicationRecord
  belongs_to :medical_condition
  has_many :doses , dependent: :destroy
  has_many :orders
  validates_presence_of :name, :side_effects
  validates :name, uniqueness: true
end
