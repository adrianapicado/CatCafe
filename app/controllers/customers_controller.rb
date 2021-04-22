class CustomersController < ApplicationController
   
    def new
      if logged_in?
        redirect_to customer_path(current_user)
      else
      @customer = Customer.new
      end
    end
    
    def create
      @customer = Customer.create(customer_params)
       if @customer.save
         session[:user_id] = @customer.id
         redirect_to customer_path(@customer)
       else
         render :new
       end
    end
    
    def show
     if params[:id].to_i == session[:user_id]    
        @customer = Customer.find_by_id(params[:id])
        @customer_appointments = @customer.appointments
      elsif current_user
            redirect_to customer_path(current_user)
      else
            redirect_to '/' 
       end
    end

    private 

    def customer_params
        params.require(:customer).permit(:username, :password)
    end
    
end
