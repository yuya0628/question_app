class QuestionMailer < ApplicationMailer

  def creation_email
    @user=params[:user]
    @question=params[:question]
    mail(
      subject:'質問投稿メール',
      to:'@user.email',
      from:'questionleaf@example.com'
    )
  end 

end
