class AuctionsController < ApplicationController

    def index
        @auctions = Auction.all
    end

    def show
        @auction = Auction.find(params[:id])
    end

    def pujar
        @auction = Auction.find(params[:id])
        if params[:auction][:bid]
            if (@auction.minBid < params[:auction][:bid].to_i)
                if @auction.update(price: @auction.price+params[:auction][:bid].to_i, user_id: current_user.id)
                    redirect_to auction_path(@auction)
                end
            else
                redirect_to missubastas_path, notice: "Puja insuficiente"
            end
        else
            redirect_to missubastas_path, notice: "Falló la petición"
        end
      
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
        if current_user.user_type == 4 || current_user.user_type == 1
            
            if @auction.update(a_params)
                redirect_to auctions_path, notice: "Subasta creada"
            end
        else
            if params[:auction][:bid]
                if (@auction.minBid < params[:auction][:bid].to_i)
                    if @auction.update(price: @auction.price + params[:auction][:bid].to_i, user_id: current_user.id)
                        redirect_to auction_path(@auction)
                    end
                else
                    redirect_to missubastas_path, notice: "Puja insuficiente"
                end
            else
                redirect_to missubastas_path, notice: "Falló la petición"
            end
        end
    end

    
    def iniciarsubasta
        @auction = Auction.find(params[:id])
        @auction.attributes = {started: true}
        if @auction.save
            
            redirect_to subastasactivas_path
        end
        

    end

    def terminarsub
        
        @auction = Auction.find(params[:id])
        Reservation.create(user_id: @auction.user_id, residence_id: @auction.residence_id, week_id: @auction.week_id)

        @u = User.find(@auction.user_id)
        @r = Residence.find(@auction.residence_id)
        @w = Week.find(@auction.week_id)
            
        @u.update_attribute(:credits, @u.credits - 1)
        @r.update_attribute(:reserved, true)
        @w.update_attribute(:reserved, true)
        
        Apetition.where(residence_id: @auction.residence_id, week_id: @auction.week_id).each do |a|
            a.destroy
        end

        if @auction.destroy
            redirect_to subastasactivas_path
        end

    end



    def missubastas
        if current_user.user_type == 2
            ap = Apetition.where(email: current_user.email).take
            if (!ap.nil?)
                @auctions = Auction.where(residence_id: ap.residence_id, week_id: ap.week_id)
            end
        elsif current_user.user_type == 3
            @auction = Auction.where(started: true)
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
        params.permit(:residence_id, :startPrice, :week_id, :price)
    end
    
end


