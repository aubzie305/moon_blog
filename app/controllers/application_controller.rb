class ApplicationController < ActionController::Base
  before_action :log_info

  def log_info 
    p '*' * 100
    #p controller 
    p '*' * 100
  end
  
  private
    def after_sign_out_path_for(resource_or_scope)
      goodbye_path
    end

    def after_sign_in_path_for(resource_or_scope)
      moony_path(current_user)
    end
end
