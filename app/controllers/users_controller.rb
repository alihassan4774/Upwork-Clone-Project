class UsersController < ApplicationController
  before_action :authenticate_user!


  def destroy_account
    current_user.destroy
    redirect_to root_path, notice: "Your account has been permanently deleted."
  end
end
