class ApplicationController < ActionController::Base
end

  	private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_name, :user_id, :customer_status, :image, :profile, :password, :email])
    end
