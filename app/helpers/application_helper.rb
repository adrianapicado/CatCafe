module ApplicationHelper

    def current_user
        @current_user ||= Customer.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        current_user
    end
    

end
