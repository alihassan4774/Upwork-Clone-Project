# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  protected

   def after_sign_in_path_for(resource)
    if resource.client?
      user_client_path
    elsif resource.freelancer?
      user_freelancer_path
    else
      role_path
    end
   end
end
