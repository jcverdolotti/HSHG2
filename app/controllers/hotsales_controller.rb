class HotsalesController < ApplicationController
    
    def index
        @hs = Hotsale.all
    end

    def edit
        @hs = Hotsale.find(params[:id])
    end

    def setearhsp
        @hs = Hotsale.find(params[:id])
        @hs.update(hotsale_params)
        if @hs.save
            redirect_to hotsales_path,  notice: "Genial, se guardó"
        end
    end

    def new
        @hs = Hotsale.new
    end

    def update
        @hs = Hotsale.find(params[:id])
       
        if @hs.update(hotsale_params)
            redirect_to hotsales_path,  notice: "Oferta creada"
        end
    end

    def crearhs
        @hs = Hotsale.create()
        @hs.update(hotsale_paramss)
    
        if @hs.save
         redirect_to edit_hotsale_path(@hs)
        end
    end

    def destroy
        @hs = Hotsale.find(params[:id])
        if @hs.destroy
            redirect_to hotsales_path, notice: "Oferta eliminada"
        end
    end

    def hotsale_paramss
        params.permit(:residence_id, :week_id, :hotsale_price)
    end

    def hotsale_params
        params.require(:hotsale).permit(:residence_id, :week_id, :hotsale_price)
    end


end
