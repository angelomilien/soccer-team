class UsersController < ApplicationController
    
    def signup
       @user = User.new(user_params(:user_name, :email, :password))
       if @user.save
          #log user on creating
          session[:user_id] = @user.id
          redirect_to players_path
       else
          render "sessions/signup"
       end
    end

    def login
        @user = User.find_by(email: params[:user][:email])
        puts auth.class
        if @user && @user.authenticate(params[:user][:password])
           #log user on finding
           session[:user_id] = @user.id
           redirect_to players_path
        else
           flash[:error] = "Sorry, your username or password was incorrect"
           redirect_to "/login"
        end 
    end

    def fbcreate
        puts auth.class
        puts "jwkshfkfjsufo dhkshfklsf jwkfhksfyh"
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
    end
    
        session[:user_id] = @user.id
    
        render 'sessions/home'
    end
    

    private
    
    def auth
      request.env['omniauth.auth']
    end

    def user_params(*args)
        params.require(:user).permit(*args)
    end    
end