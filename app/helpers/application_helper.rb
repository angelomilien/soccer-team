module ApplicationHelper

    def home
        if logged_in?
           redirect_to user_path(current_user)
        else
           render 'home.html.erb'
        end 
    end 
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end 

    def redirect_if_not_logged_in
        redirect_to if !logged_in?
    end
  
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
