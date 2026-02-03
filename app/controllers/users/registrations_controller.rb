class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  protected

  def build_resource(hash = {})
    super
    resource.role ||= params.dig(:user, :role)
  end

  def after_sign_up_path_for(resource)
    if resource.client?
      new_client_profile_path
    elsif resource.freelancer?
      new_freelancer_profile_path
    else
      root_path
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role ])
  end
end
