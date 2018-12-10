class ApetitionsController < ApplicationController
    def index
		@apetitions = Apetition.all
	end

	def new
		@apetition = Apetition.new
	end

	def edit
		@apetition = Apetition.find(params[:id])
	end
	
	def update
		@apetition = Apetition.find(params[:id])
       
        if @apetition.update(ap_params)
            redirect_to root_path,  notice: "Registro con éxito"
        end
	end


	def create
		@apetition= Apetition.new(apetition_params)
       
        if @apetition.save
 			redirect_to root_path, notice: "Su peticion ha sido creada. Espere la respuesta de un Admin"
        else
            render :new
        end 

	end

	def registrosubasta
		@apetition = Apetition.create()
		@apetition.update(apetition_params)

		if @apetition.save
			redirect_to edit_apetition_path(@apetition)
		end

	end


	def destroy
		@apetition=AuctionPetition.find(params[:id])
        if @apetition.destroy
            redirect_to petitions_path
        end

	end

	def apetition_params
        params.permit(:email, :residence_id, :week_id)
	end
	
	def ap_params 
		params.require(:apetition).permit(:email, :residence_id, :week_id)
	end


end
