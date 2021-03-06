class SessionsController < ApplicationController

    def home
    end

    def new
      if logged_in?
        redirect_to customer_path(current_user)
      end
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

    def omniauth
      @user = Customer.find_or_create_by(uid: request.env['omniauth.auth'][:uid]) do |u|
        u.username = request.env['omniauth.auth'][:info][:first_name]
        u.password = SecureRandom.hex(10)
    end
    if @user.valid?
      session[:user_id] = @user.id 
      redirect_to customer_path(current_user)
    else
      redirect_to login_path 
    end 
  end 

end