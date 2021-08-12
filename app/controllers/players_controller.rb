class PlayersController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_player, only: [:show, :update, :edit, :destroy]

    def index
        # byebug
        @players = Player.all
        # byebug
    end


    def show
        # byebug
    end
    
    def create
        
    end

    def edit
        
    end

    def update
        
    end 

    def destroy
        
    end

    private 

    # def shoe_params
    #     params.require(:shoe).permit(:color, :price, :condition, :brand_id, brand_attributes: [:name, :year_founded])
    # end

    def find_player 
        @player = Player.find_by_id(params[:id])
    end
    
end