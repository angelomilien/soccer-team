class PlayersController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_player, only: [:show, :update, :edit, :destroy]
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create]


    def new
        @player = Player.new
        @player.build_team
        # @team.build_country
    end
    
    def index
        @players = Player.all
    end


    def show
        # byebug
    end
    
    def create
        @player = Player.new(player_params)
        byebug
    end

    def edit
        
    end

    def update
        
    end 

    def destroy
        
    end

    private 

    def player_params
        params.require(:player).permit(:name, :age, :position, :number, :coach_id, team_attributes: [:name, :country_name])
    end

    def find_player 
        @player = Player.find_by_id(params[:id])
    end  
    
    # def redirect_if_not_authorized
    #     if @player.coach != current_user
    #       redirect players_path 
    #     end 
    # end
end