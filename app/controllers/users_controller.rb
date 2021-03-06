class UsersController < ApplicationController
    

    
    def new
        @user = User.new 
    end
     
    def show 
        @user = User.find_by_id(params[:id])
    end

    def signup
       @user = User.new(user_params(:user_name, :email, :password))
       if @user.save
          #log user on creating
          session[:user_id] = @user.id
          flash[:message] = "Successful Login!!"
          redirect_to players_path
       else
          render :new
       end
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end    
end