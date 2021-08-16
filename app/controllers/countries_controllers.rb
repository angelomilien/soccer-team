class PlayersController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_player, only: [:show, :update, :edit, :destroy]
    # skip_before_action :redirect_if_not_logged_in, only: [:new, :create]


    def show
        @country = Country.find_by_id(params[:id])
    end
    

    private 

    # def player_params
    #     params.require(:shoe).permit(:color, :price, :condition, :brand_id, brand_attributes: [:name, :year_founded])
    # end
end