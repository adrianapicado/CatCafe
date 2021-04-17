class AppointmentsController < ApplicationController

    def new 
      @customer = Appointment.find_by_id(params[:customer_id])
      @appointment = Appointment.new
      @appointment.build_cat
    end

    def create
      @appointment = Appointment.new(appointment_params)
      @appointment.customer_id = session[:user_id]
      if @appointment.save
        redirect_to appointment_path(@appointment)      
      else
        render :new
      end
    end

    def show 
      @appointment = Appointment.find_by_id(params[:id])
      redirect_to '/' if !@appointment
    end 


    def index
     if params[:customer_id].to_i == session[:user_id]
  
        @customer = Customer.find_by_id(params[:customer_id])
        @appointments = @customer.appointments
  
        elsif @current_user
           redirect_to customer_path(@current_user)
  
        else
           redirect_to '/' 
        end
    end
  
    
    private 

    def appointment_params
     if params[:appointment][:cat_attributes][:name] == ""
        params.require(:appointment).permit(:date, :name, :coffee, :cat_id, :customer_id)
     else
        params.require(:appointment).permit(:date, :name, :coffee, :cat_id, :customer_id, cat_attributes:[:name, :mittens])
     end
    end

end





