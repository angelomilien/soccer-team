class PlayersController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_player, only: [:show, :update, :edit, :destroy]
    before_action :redirect_if_not_authorized, only: [:show, :update, :edit, :destroy]
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create]


    def new
        if params[:team_id] && @team = Team.find_by_id(params[:team_id])
    
            if current_user.teams.include? @team
                @player = @team.players.build
            else
                flash[:message] = "you have been redirected"
                redirect_to players_path
            end
        else
            @player = Player.new
            @player.build_team
        end
    end
    
    def index
        if params[:team_id] && @team = Team.find_by_id(params[:team_id])
            if current_user.teams.include? @team
               @players = @team.players
            else
                flash[:message] = "you have been redirected"
                redirect_to players_path
            end
        else
            @players = Player.order_alphabetically
        end
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
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to players_path, :notice => "Your player has been deleted"
    end




    private 



    def player_params
        params.require(:player).permit(:name, :age, :team_id, :position, :number, :coach_id, team_attributes: [:name, :country_name])
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