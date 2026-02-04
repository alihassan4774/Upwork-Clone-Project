class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  protected
  # Ye method user signup / registration ke time role set karta hai
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

  # Ye code Devise ko allow deta hai ke signup ke time role parameter accept kare.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role ])
  end
end
