class AuctionsController < ApplicationController

    def index
        @auctions = Auction.all
    end

    def show
        @auction = Auction.find(params[:id])
    end

    def new
        @auction = Auction.new
    end
    
    def create
        @auction = Auction.new(a_params)
        if @auction.save
            redirect_to root_path
        end

    end
    
    def edit
        @auction = Auction.find(params[:id])
    end

    def update 
        @auction = Auction.find(params[:id])
        if @auction.update(a_params)
            redirect_to auctions_path, notice: "Subasta creada"
        end
    end

    
    def iniciarsubasta
        @auction = Auction.find(params[:id])
        @auction.attributes = {started: true}
        if @auction.save
            Apetition.where(residence_id: @auction.residence_id, week_id: @auction.week_id).each do |a|
                a.destroy
            end
            redirect_to subastasactivas_path
        end
        

    end

    def terminarsubasta
        
        @auction = Auction.find(parms[:id])
        Reservation.create(user_id: @auction.user_id, residence_id: @auction.residence_id, week_id: @auction.week_id)

        @u = User.find(@auction.user_id)
        @r = Residence.find(@auction.residence_id)
        @w = Week.find(@auction.week_id)
            
        @u.update_attribute(:credits, @u.credits - 1)
        @r.update_attribute(:reserved, true)
        @w.update_attribute(:reserved, true)
        
        if @auction.destroy
            redirect_to root_path
        end

    end


    def subastasactivas
        @auctions = Auction.where(started: true)
    end

    
    def nuevasubasta 
        @auction = Auction.create()
        @auction.update(auction_paramss)
    
        if @auction.save
            redirect_to edit_auction_path(@auction)
        end     
    end
    
    def a_params
        params.require(:auction).permit(:user_id,:residence_id, :minBid, :startPrice, :price, :startDate, :endDate)
    end

    def auction_paramss
        params.permit(:residence_id, :startPrice)
    end
    
end


