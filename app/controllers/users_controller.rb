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
        if @user && @user.authenticate(params[:user][:password])
           #log user on finding
           session[:user_id] = @user.id
           redirect_to players_path
        else
           flash[:error] = "Sorry, your username or password was incorrect"
           redirect_to "/login"
        end 
    end
    
      
    #   def update
    #     @post = Post.find(params[:id])
    #     @post.update(post_params(:title))
    #     redirect_to post_path(@post)
    #   end

    private 

    def user_params(*args)
        params.require(:user).permit(*args)
    end    
end