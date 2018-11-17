class UserController < ApplicationController

def index
    @users = User.all
end

def show
    @user = User.find(params[:id])
end

def new
    @user = User.new
end

def create
    @user= User.new(residence_params)
   
    if @user.save
        redirect_to residences_path, notice: "La residencia #{@residence.name} se creó con éxito."
    else
        render :new
    end 
end

def update
    @user= User.find(params[:id])

    if @user.update(residence_params)
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

end
