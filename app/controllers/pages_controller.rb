class PagesController < ApplicationController
  def client_welcome
    authenticate_user!
    redirect_to new_client_profile_path unless current_user&.client_profile
  end
  def landing
    if user_signed_in?
      redirect_logged_in_user
    end
  end

  def redirect_logged_in_user
    if current_user.client?
      redirect_to user_client_path
    elsif current_user.freelancer?
      redirect_to user_freelancer_path
    end
  end

  def client
    @profile = current_user.profile || current_user.build_profile
  end

  def freelancer
  end

   def select_role
   end
end
