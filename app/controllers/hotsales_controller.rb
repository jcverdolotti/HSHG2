class HotsalesController < ApplicationController
    
    def index
        @hs = Hotsale.all
    end

    def new
        @hs = Hotsale.new
    end

    def create
        
        @hs = Hotsale.new(hotsale_params)
       @i = Residence.find(@hs.residence_id).id
        if @hs.save
            redirect_to hotsales_path
        else
            render :new
        end
    end

    def destroy
        #implementar bien
    end

    def hotsale_params
        params.permit(:residence_id, :week_id, :hotsale_price)
    end


end
