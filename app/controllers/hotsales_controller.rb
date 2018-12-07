class HotsalesController < ApplicationController
    
    def index
        @hs = Hotsale.all
    end

    def new
        @hs = Hotsale.new
    end

    def create
        @hs = Hotsale.new(hotsale_params)
        if @hs.save
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        #implementar bien
    end


end
