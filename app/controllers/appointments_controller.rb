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
      @customer = Appointment.find_by_id(params[:customer_id])
      @appointment = Appointment.new
      @appointment.build_cat
    end

    def create
      if current_customer && current_customer == session[:user_id]
         @appointment = current_customer.appointments.build(appointment_params)
         @appointment.customer_id = session[:user_id]          
         if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
      else
           redirect_to '/'
        end
    end

    def edit 
      @appointment = Appointment.find_by_id(params[:id])
    end

    def update 
    end

    def show 
      @appointment = Appointment.find_by_id(params[:id])
      redirect_to '/' if !@appointment
    end

    private 

    def appointment_params
     params.require(:appointment).permit(:date, :name, :coffee, :cat_id, :customer_id, cat_attributes[:name, :mittens])
    end


end
