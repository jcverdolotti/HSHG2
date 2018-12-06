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

    def destroy
        @reservation = Reservation.find(params[:id])
            @r = Residence.find(@reservation.residence_id)
            @w = Week.find(@reservation.week_id)
        if @reservation.destroy
            w.destroy
            redirect_to reservations_path
        end
    end

    def misreservas
        @reservation = Reservation.where(user_id: current_user.id).take
    end

    def reservation_params
        params.permit(:user_id, :residence_id, :week_id)
    end


end
