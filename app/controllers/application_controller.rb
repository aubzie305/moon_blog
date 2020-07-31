class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected 
    def configure_permitted_parameters 
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(:avatar, :name, :email, :password, :password_confirmation, :current_password) 
      } 
    end

  private
    def after_sign_out_path_for(resource_or_scope)
      goodbye_path
    end

    def after_sign_in_path_for(resource_or_scope)
      moony_path(current_user)
    end
end
