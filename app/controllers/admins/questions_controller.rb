class Admins::QuestionsController < ApplicationController

  before_action :require_admin


  def index
    @questions=Question.all
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to admins_questions_path
  end

  private

  def require_admin
    redirect_to questions_path unless current_user.admin?
  end

end
