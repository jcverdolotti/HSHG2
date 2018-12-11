class ResidencesController < ApplicationController
    def index
        if params[:country]
            if @residences = Residence.where('country ILIKE ?', "%#{params[:country]}%").count > 0
                @residences = Residence.where('country ILIKE ?', "%#{params[:country]}%")
            else
                if @residences = Residence.where('name ILIKE ?', "%#{params[:country]}%").count > 0
                    @residences = Residence.where('name ILIKE ?', "%#{params[:country]}%")
                else
                    if @residences = Residence.where('description ILIKE ?', "%#{params[:country]}%").count > 0
                        @residences = Residence.where('description ILIKE ?', "%#{params[:country]}%")
                    else
                        @residences = Residence.all
                        @aviso = "No se encontraron resultados"
                    end
                end
            end
        else
             @residences = Residence.all 

        end
    end

    def new
        @residence = Residence.new
    end

    def create
        @residence= Residence.new(residence_params)
       
        if @residence.save
            (1..52).each do |w|
                @week = Week.create(residence_id: @residence.id, week_date: Date.commercial(2019,w,1))
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
        @hs=Hotsale.all 
       
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

    def versemanas
        @residenceWeeks = Residence.find(params[:id]).weeks.dosmeses
    end

    def versemanasvencidas
        @residenceWeeks = Residence.find(params[:id]).weeks.nodisponible
    end



    def residence_params
        params.require(:residence).permit(:location, :description, :date, :cost, :people_amount, :id, :name, :image, :country, :province)
    end

end
