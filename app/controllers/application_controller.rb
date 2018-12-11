class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action  :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :last_name, :genre, :age, :email, :card_number, :card_SC, :card_expDate, :password, :credits) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :last_name, :genre, :age, :email, :card_number, :card_SC, :card_expDate, :current_password) }
        end
end
