class SessionsController < ApplicationController

    def home
    end

    def new
    end

    def create 
     @customer = Customer.find_by(username: params[:customer][:username]) 
      if @customer.try(:authenticate, params[:customer][:password])
         session[:user_id] = @customer.id
         redirect_to customer_path(@customer)
       else
         redirect_to login_path      
       end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    #omniauth

end