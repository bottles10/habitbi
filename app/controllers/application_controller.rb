class ApplicationController < ActionController::Base
    include Pagy::Backend
 
    before_action :configure_permitted_parameters, if: :devise_controller?
    


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    end


    def after_sign_in_path_for(resource)
      # Replace 'your_desired_path' with the actual path you want to redirect to
      habits_path
    end
  

end
