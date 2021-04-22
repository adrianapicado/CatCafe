class Appointment < ApplicationRecord
    belongs_to :cat
    belongs_to :customer

    validates :coffee, presence: true 

    accepts_nested_attributes_for :cat

    scope :newest, -> { order(created_at: :desc) } #most recently created appointments!

    
end
