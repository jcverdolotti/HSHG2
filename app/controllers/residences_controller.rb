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
            (1..52).each do |w|
                @week = Week.create(residence_id: @residence.id, weekDate: Date.commercial(2019,w,1))
            end
            redirect_to residences_path, notice: "La residencia #{@residence.name} se creó con éxito."
        else
            render :new
        end 
    end

    def edit
        @residence = Residence.find(params[:id])
    end

    def home
        #@residence = Residence.find(1)
    end

    def update
        @residence= Residence.find(params[:id])

        if @residence.update(residence_params)
            redirect_to residences_path, notice: "La residencia #{@residence.name} se modificó correctamente."
        else
            render :edit
        end
    
    end

    def show
        @residence = Residence.find(params[:id])
    end

    def destroy
        @residence=Residence.find(params[:id])
        if @residence.reserved
            @residence.update(logic_delete: true)
            redirect_to residences_path, notice: 'Baja lógica correcta'
        elsif @residence.destroy
            redirect_to residences_path, notice: 'La residencia se eliminó correctamente'
        end
    end


    def residence_params
        params.require(:residence).permit(:location, :description, :date, :cost, :people_amount, :id, :name, :image, :country, :province)
    end

end
