class PetitionsController < ApplicationController
	def index
		@petitions = Petition.all
	end

	def new
		@petition = Petition.new
	end

	def create
		@petition= Petition.new(petition_params)
       
        if @petition.save
 			redirect_to root_path, notice: "Su peticion ha sido creada. Espere la respuesta de un Admin"
        else
            render :new
        end 

	end

	def destroy
		@petition=Petition.find(params[:id])
        if @petition.destroy
            redirect_to petitions_path
        end

	end

	def petition_params
        params.require(:petition).permit(:email, :current_uType)
    end

end
