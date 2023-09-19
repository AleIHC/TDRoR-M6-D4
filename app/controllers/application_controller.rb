class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def authorize_request(kind = nil)
      unless kind.include?(current_kp_user.role)
          redirect_to root_path, notice: "No estás autorizado"
      end
  end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end
  
    
end
