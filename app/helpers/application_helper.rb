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
            button_to("Sign in with Google", '/auth/google_oauth2', style: "background-color: #dd4b39;", class: "btn btn-lg btn-block btn-primary") 
        else 
            button_to("Log Out", logout_path, method: 'delete', class: "btn btn-dark btn-lg btn-block")
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



# <section class="vh-100" style="background-color: #476072;">
#    <div class="container py-5 h-100">
#       <div class="row d-flex justify-content-center align-items-center h-100">
#          <div class="col-12 col-md-8 col-lg-6 col-xl-5">
#             <div class="card shadow-2-strong" style="border-radius: 1rem;">
#                <div class="card-body p-5 text-center">
#                   <h1>Signup here<h1><br>
   
#                   <%= render partial: "errors", locals: {object: @user} %>
   
#                   <%= form_for @user, url: signup_path do |f|%>

#                   <div class="form-outline mb-4">
#                      <%= f.label :username %>
#                      <%= f.text_field :user_name, class: 'form-control form-control-lg'%><br>
#                   </div>  

#                      <%= render partial: "input", locals: {f: f} %>
#                   <%end%>
   
#                   <%=button_to_welcome_home_page%>
#                   <%=navigation_helper%>
#                </div>
#             </div>
#          </div>
#       </div>
#    </div>
# </section>




# <section class="vh-100" style="background-color: #476072;">
#    <div class="container py-5 h-100">
#       <div class="row d-flex justify-content-center align-items-center h-100">
#          <div class="col-12 col-md-8 col-lg-6 col-xl-5">
#             <div class="card shadow-2-strong" style="border-radius: 1rem;">
#                <div class="card-body p-5 text-center">
#                   <h1>Login here</h1><br>
            
#                   <%= flash[:error]%><br><br>
            
#                   <%= form_for :user, url: signing_path do |f|%>
                     
#                      <%= render partial: "users/input", locals: {f: f} %>
#                   <%end%><br>
   
#                   <%=button_to_welcome_home_page%><br>
#                   <%=navigation_helper%>
#                </div>
#             </div>
#          </div>
#       </div>
#    </div>
# </section>