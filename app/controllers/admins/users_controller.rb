class Admins::UsersController < ApplicationController

  before_action :require_admin

  def index
    @users=User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admins_users_path
  end

  private

  def require_admin
    redirect_to questions_path unless current_user.admin?
  end

end
