class ResidencesController < ApplicationController
    def index
        @residences = Residence.all
    end

    def new
        @residence = Residence.new
    end

    def create
        @residence= Residence.new(residence_params)
       
        if @residence.save
            redirect_to residences_path, notice: "La residencia #{@residence.name} se creó con éxito."
        else
            render :new
        end 
    end

    def edit
        @residence = Residence.find(params[:id])
    end

    def update
        @residence= Residence.find(params[:id])

        if @residence.update(residence_params)
            redirect_to residences_path, notice: "La residencia #{@residence.name} se modificó correctamente."
        else
            render :edit
        end
    
    end

    def residence_params
        params.require(:residence).permit(:location, :description, :date, :cost, :people_amount, :id, :name)
    end

end
