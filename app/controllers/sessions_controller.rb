class SessionsController < ApplicationController
    

    def signup
       @user = User.new 
    end

    def home    
    end

    def login    
    end

    def logout
        session.clear
        redirect_to '/'
    end
    
 
end