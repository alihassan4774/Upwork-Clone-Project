module PermissionParameters
  extend ActiveSupport::Concern

  # Name field ko fill krna ka liya edit page pe
  included do
     before_action :configure_permitted_parameters, if: :devise_controller?
  end

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :password ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :password ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :password ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :password ])
    end
end