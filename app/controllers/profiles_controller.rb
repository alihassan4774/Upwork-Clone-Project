class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @profile = current_user.profile || current_user.create_profile
    @editing_section = params[:edit_section]  # Ye check karega kis card ko edit karna hai
  end
  
  def update
    @profile = current_user.profile
    
    if @profile.update(profile_params)
      redirect_to profile_path, notice: '✅ Changes saved successfully!'
    else
      # Agar error ho to wapis wohi section edit mode mein dikha do
      @editing_section = params[:edit_section]
      render :show, status: :unprocessable_entity
    end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(
      :company_name, :size, :bio, 
      :phone, :vat_id, :timezone, :address
    )
  end
end