# app/controllers/freelancer_profiles_controller.rb
class FreelancerProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @freelancer_profile = current_user.build_freelancer_profile
  end

  def create
    @freelancer_profile = current_user.build_freelancer_profile(freelancer_profile_params)

    if @freelancer_profile.save
      redirect_to user_freelancer_path(@freelancer_profile), notice: "Profile created successfully!"
    else
      render :new
    end
  end

  def show
    @freelancer_profile = FreelancerProfile.find(params[:id])
  end


  

  private

  def freelancer_profile_params
    params.require(:freelancer_profile).permit(:skills, :fixed_price, :portfolio_url)
  end
end
