class UsersController < ApplicationController
    
    def signup
        @user = User.new(user_params(:user_name, :email, :password))
       if @user.save
          #log user on creating
          session[:user_id] = @user.id
          redirect_to teams_path
       else
          render "sessions/signup"
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