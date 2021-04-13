class Cat < ApplicationRecord
    has_many :appointments
    has_many :customers, through :appointments
end
