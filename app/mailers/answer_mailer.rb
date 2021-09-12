class AnswerMailer < ApplicationMailer
  def creation_email
   @answer = params[:answer]
   mail(
     subject: "回答されました",
     to: @answer.user.email,#@answer.question.user.email
     from: "questionleaf@example.com"
   )
  end
end
