class Questions::AnswersController < ApplicationController

  def create
    answer = Answer.new(answer_params)
    answer.question_id = params[:question_id] # answer.question_id = params[:question_id] じゃダメなん？
    answer.user_id = current_user.id
    if answer.save
       AnswerMailer.with(answer:answer).creation_email.deliver_now
       redirect_to question_path(params[:question_id]),notice:"回答が送信されました"
    else
       redirect_to question_path(params[:question_id])
    end
  end

  def destroy
    Answer.find_by(id: params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
