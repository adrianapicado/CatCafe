class CustomersController < ApplicationController
    has_many :appointments
    has_many :cats, through :appointments
end
