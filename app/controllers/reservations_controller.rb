class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all
    end

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save 
            @u = User.find(@reservation.user_id)
            @r = Residence.find(@reservation.residence_id)
            @w = Week.find(@reservation.week_id)
            
            @u.attribute = {credits: (@u.credits - 1)}
            @r.attribute = {reserved: true}
            @w.attribute = {reserved: true}

            redirect_to back, notice: "Su reserva se creó correctamente"
         else
            render :new
         end

    end

    def nuevareserva
        @reservation = Reservation.create()
        @reservation.update(reservation_params)
 
        if @reservation.save 
            @u = User.find(@reservation.user_id)
            @r = Residence.find(@reservation.residence_id)
            @w = Week.find(@reservation.week_id)
            
            @u.update_attribute(:credits, @u.credits - 1)
            @r.update_attribute(:reserved, true)
            @w.update_attribute(:reserved, true)

            redirect_to misreservas_path, notice: "Su reserva se creó correctamente"
         else
            render :new
         end
     end

     def nuevareservahs
        @reservation = Reservation.create()
        @reservation.update(reservation_params)
 
        if @reservation.save 
            @r = Residence.find(@reservation.residence_id)
            @w = Week.find(@reservation.week_id)
            @hs = Hotsale.where(residence_id: @r.id).take
            @hs.destroy

            @r.update_attribute(:reserved, true)
            @w.update_attribute(:reserved, true)

            redirect_to misreservas_path, notice: "Su reserva se creó correctamente"
         else
            render :new
         end
     end

     

    def destroy
        @reservation = Reservation.find(params[:id])
            @r = Residence.find(@reservation.residence_id)
            @week = Week.find(@reservation.week_id)
        if @reservation.destroy
            @week.update_attribute(:reserved, false)
            redirect_to misreservas_path
        end
    end

    def misreservas
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def reservation_params
        params.permit(:user_id, :residence_id, :week_id)
    end


end
