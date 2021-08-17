class PlayersController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_player, only: [:show, :update, :edit, :destroy]
    before_action :redirect_if_not_authorized, only: [:show, :update, :edit, :destroy]
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create]


    def new
        @player = Player.new
        @player.build_team
    end
    
    def index
        # @players = Player.all
        @players = Player.order_alphabetically
    end


    def show
    end

    def edit
    end

    
    def create
        @player = Player.new(player_params)
        if @player.save
            redirect_to player_path(@player)
        else
            render :new
        end
    end

    def update
        @player.update(player_params)
        redirect_to player_path(@player)
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
    
    def redirect_if_not_authorized
        if @player.coach != current_user
          redirect_to players_path 
        end 
    end
end