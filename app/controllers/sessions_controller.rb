class SessionsController < ApplicationController
    
    def home    
    end

    def login
       @user = User.new 
    end

    def signing
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
           #log user on finding
           session[:user_id] = @user.id
           flash[:message] = "Successful Login!!"
           redirect_to players_path
        else
           flash[:error] = "Sorry, your username or password was incorrect"
           redirect_to login_path
        end 
    end

    def omniauth
        user = User.from_google_omniauth(auth)
        if user.valid? 
            session[:user_id] = user.id
            flash[:message] = "Successful Login!!"
            redirect_to players_path
        else
            flash[:error] = "please try again"
            redirect_to login_path
        end
    end

    def logout
        session.delete(:user_id)
        @current_user = nil
        redirect_if_not_logged_in
    end

    private

    def auth 
     request.env['omniauth.auth']
    end
end