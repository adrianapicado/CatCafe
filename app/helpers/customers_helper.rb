module CustomersHelper

    def current_customer
        @current_customer ||= Customer.find_by_id(session[:user_id])
    end

    def correct_customer
        @customer = Customer.find_by_id(session[:user_id]) if params[:id].to_i == session[:user_id]

    end

    
end
