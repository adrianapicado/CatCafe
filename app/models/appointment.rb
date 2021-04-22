class Appointment < ApplicationRecord
    belongs_to :cat
    belongs_to :customer

    accepts_nested_attributes_for :cat

    
end
