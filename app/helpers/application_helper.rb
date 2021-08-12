module ApplicationHelper

    def home
        if logged_in?
           redirect_to user_path(current_user)
        else
           render 'home.html.erb'
        end 
    end 
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) #if session[:user_id]
    end

    def logged_in?
        !!current_user
    end 

    # def redirect_if_not_logged_in
    #     redirect_to if !logged_in?
    # end
  
    def logout
        session.delete(:user_id)
        @current_user = nil
        redirect_if_not_logged_in
    end

    def redirect_if_not_logged_in
        if !logged_in?
          redirect_to root_path
        end
    end

    # def navigation_helper 
    #     if !logged_in?
    #         button_to("Sign in with Google", '/auth/google_oauth2') 
    #     else 
    #         link_to("Log Out", logout_path, method: 'delete')
    #     end
    # end

    # def redirect_if_not_authorized(resource)
    #     if resource.user != current_user
    #       redirect "/stops"
    #     end 
    # end
end
