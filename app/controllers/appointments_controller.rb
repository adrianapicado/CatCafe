class AppointmentsController < ApplicationController

    def index
      if params[:customer_id].to_i == session[:user_id]

         @customer = Customer.find_by_id(params[:customer_id])
         @appointments = @customer.appointments

      elsif current_customer
         redirect_to customer_path(current_customer)

      else
         redirect_to '/' 
      end
    end

    def new
    end

    def create
    end

    def edit 
    end

    def update 
    end

    def show 
    end

    private 

end
