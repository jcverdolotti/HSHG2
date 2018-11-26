class VistasController < ApplicationController

    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        if @user.user_type == 2
            @user.attributes = {user_type: '3'}
        elsif @user.user_type == 3
            @user.attributes = {user_type: '2'}
        end

        if @user.save
          redirect_to petitions_path
          p=Petition.where(email: @user.email).take
          p.destroy
        else
            render :show
        end
    end


    end