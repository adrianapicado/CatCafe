class Customer < ApplicationRecord
    
    has_secure_password
    
    has_many :appointments
    has_many :cats, through: :appointments

    validates :username, uniqueness: true, presence: true 
    validates :username, length: { minimum: 3 }
    validates :username, length: { maximum: 10 }

    

end
