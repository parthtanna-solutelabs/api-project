class MedicalCondition < ApplicationRecord
  belongs_to :disease
  has_many :medicines
  validates_presence_of :name
  validates :name, uniqueness: true
end
