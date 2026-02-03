class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include PermissionParameters


  def after_sign_in_path_for(resource)
    if resource.client?
      new_client_profile_path
    elsif resource.freelancer?
      new_freelancer_profile_path
    else
      root_path
    end
  end
end
