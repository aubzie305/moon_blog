class ApplicationController < ActionController::Base
  before_action :log_info
  before_action :configure_permitted_parameters, if: :devise_controller?

  def log_info 
    p '*' * 100
    #p controller 
    p '*' * 100
  end

  protected 
    def configure_permitted_parameters 
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

  private
    def after_sign_out_path_for(resource_or_scope)
      goodbye_path
    end

    def after_sign_in_path_for(resource_or_scope)
      moony_path(current_user)
    end
end
