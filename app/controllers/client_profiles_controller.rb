# app/controllers/client_profiles_controller.rb
class ClientProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @client_profile = current_user.build_client_profile
  end

 def create
  @client_profile = current_user.build_client_profile(client_profile_params)

  if @client_profile.save
    redirect_to user_client_path, notice: "Profile created successfully!"
  else
    render :new
  end
end



  def show
    @client_profile = ClientProfile.find(params[:id])
  end

  private

  def client_profile_params
    params.require(:client_profile).permit(:company_name, :bio)
  end
end
