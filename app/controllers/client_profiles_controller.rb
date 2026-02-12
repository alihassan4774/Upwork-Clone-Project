# app/controllers/client_profiles_controller.rb
class ClientProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile || Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    # Convert comma-separated string to array
    process_skills_array

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
    # Convert comma-separated string to array
    process_skills_array

    if @profile.update(profile_params)
      redirect_to request.referrer || profile_path, notice: "Profile updated successfully!"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :email,
      :image,
      :company_name,
      :size,
      :bio,
      :phone,
      :vat_id,
      :timezone,
      :address,
      :education,
      :experience_title,
      :experience_company,
      :experience_duration,
      :experience_description,
      :degree,
      :complete_year,
      :university,
      :skills,
      :fixed_price,
      :portfolio_url
    )
  end

  def process_skills_array
    if params[:profile][:skills].is_a?(String)
      # Convert "Ruby, JavaScript, CSS" to ["Ruby", "JavaScript", "CSS"]
      @profile.skills = params[:profile][:skills]
                          .split(",")
                          .map(&:strip)
                          .reject(&:blank?)
    end
  end
end
