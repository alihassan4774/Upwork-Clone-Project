class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :show, :edit, :update ]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(
      :image, :first_name, :last_name, :email, :company_name,
      :size, :phone, :vat_id, :timezone, :address, :bio,
      :skills, :fixed_price, :portfolio_url, :experience,
      :education,
      :experience_title,
      :experience_company,
      :experience_duration,
      :experience_description,

    )
  end
end
