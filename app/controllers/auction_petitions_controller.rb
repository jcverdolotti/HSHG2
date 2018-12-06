class AuctionPetitionsController < ApplicationController
    def index
		@apetitions = AuctionPetition.all
	end

	def new
		@apetition = AuctionPetition.new
	end

	def create
		@apetition= AuctionPetition.new(apetition_params)
       
        if @apetition.save
 			redirect_to root_path, notice: "Su peticion ha sido creada. Espere la respuesta de un Admin"
        else
            render :new
        end 

	end

	def destroy
		@apetition=AuctionPetition.find(params[:id])
        if @apetition.destroy
            redirect_to petitions_path
        end

	end

	def apetition_params
        params.require(:petition).permit(:email, :residence_id)
    end
end
