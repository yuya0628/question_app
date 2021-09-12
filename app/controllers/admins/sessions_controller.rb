class Admins::SessionsController < ApplicationController

  before_action :require_admin,only:[:destroy]

  skip_before_action :login_required,only:[:new,:create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    
    if user &.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to(admins_questions_path,noyice:"管理者としてログインしました")
    else  
      render :new
    end  
  end

  def destroy
    reset_session
    redirect_to admins_login_path,notice:"管理者としてログアウトしました"
  end
  
  private

  def require_admin
    redirect_to questions_path unless current_user.admin?
  end


  def session_params
    params.require(:session).permit(:email, :password)
  end

end
