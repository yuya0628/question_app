class ApplicationController < ActionController::Base

  helper_method :current_user  #全てのviewで current_userメソッドが使えるようになる

  before_action :login_required #全てのコントローラーは実行前にログインを必要とする

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])  if session[:user_id]
  end

  def login_required
    redirect_to login_users_url unless current_user
  end
end
