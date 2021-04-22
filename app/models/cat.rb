class Cat < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments

    validates :name, uniqueness: true, presence: true 
    
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 10 }
    
end
