# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  #GET /resource/sign_up
  def new
    super
    @user=User.new
 end

 #POST /resource
  def create
    super
    @user = User.new(params.require(:user).permit(:name, :last_name, :genre, :age, :card_number, :card_SC, :card_expDate, :credits))
    
     if @user.save
      redirect_to user_index_path, notice: "El usuario #{@user.name} se creó con éxito."
     else
       redirect_to root_path, notice:"No se creo el usuario"
     end
 end

  # GET /resource/edit
   def edit
     super
     @user = User.find(params[:id])
   end

  # PUT /resource
   def update
     super
     @user = User.find(params[:id])
     if @user.update(params.require(:user).permit(:name, :last_name, :genre, :age, :card_number, :card_SC, :card_expDate))
      redirect_to vistas_path(current_user), notice: "El usuario #{@user.name} se creó con éxito."
     else
        render :edit
     end
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :genre, :age, :card_number, :card_SC, :card_expDate])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :genre, :age, :card_number, :card_SC, :card_expDate])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
