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

    def redirect_if_not_logged_in
        if !logged_in?
          redirect_to root_path
        end
    end

    def button_to_welcome_home_page
        button_to "Home", root_path, method: 'get', class: "btn btn-dark btn-lg btn-block"   
    end

    def session_home
        button_to "Home", players_path, method: 'get'
    end
    
    

    def navigation_helper 
        if !logged_in?
            button_to("Sign in with Google", '/auth/google_oauth2', style: "background-color: #dd4b39;", class: "btn btn-lg btn-block btn-primary fab fa-google me-2") 
        else 
            button_to("Log Out", logout_path, method: 'delete')
        end
    end


    def home_nav_button
        button_to "Home", players_path, method: 'get', class: ""
    end

    def logout_nav_button
        button_to "Log out", logout_path, method: 'delete'
    end

    def edit_nav_button
        button_to "Edit", edit_player_path, method: 'get'
    end
    
    
    

    

    # def redirect_if_not_authorized(resource)
    #     if resource.coach_id != current_user.id
    #       redirect_to players_path
    #     end 
    # end
end
