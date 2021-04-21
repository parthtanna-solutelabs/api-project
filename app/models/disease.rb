class Disease < ApplicationRecord
    validates_presence_of :disease_type
    has_many  :medical_conditions
    validates :disease_type, uniqueness: true
end
