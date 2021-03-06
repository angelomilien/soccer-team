class TeamsController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_team, only: [:show, :update, :edit, :destroy]


    def index
        
    end

    def show
        
    end
    
    def edit
        
    end

    def update
        
    end  
    

    private

    def find_team 
        @team = Team.find_by_id(params[:id])
    end 

    def redirect_if_not_authorized
        if @team.id != current_user
          redirect_to players_path 
        end 
    end

end