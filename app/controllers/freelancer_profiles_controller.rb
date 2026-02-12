# app/controllers/freelancer_profiles_controller.rb
class FreelancerProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile || Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to user_client_path, notice: "Profile created successfully!"
    else
      render :new
    end
  end



  def show
    @profile = Profile.find(params[:id])
  end

   def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to request.referrer || profile_path, notice: "Profile updated successfully!"
    else
      render :edit
    end
  end




  private

  def freelancer_profile_params
    params.require(:freelancer_profile).permit(:skills, :fixed_price, :portfolio_url, :education, :experience,
      :education,
      :experience_title,
      :experience_company,
      :experience_duration,
      :experience_description,)
  end
end
