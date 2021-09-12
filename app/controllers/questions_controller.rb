class QuestionsController < ApplicationController

  skip_before_action :login_required,only:[:index]

  before_action :set_q,only:[:index,:solved,:unsolved]

  def new
    @question=Question.new
  end

  def create
    @question=Question.new(question_params)
    @question.user_id = current_user.id

     if @question.save
      User.all.each do |user|
        QuestionMailer.with(user: user, question: @question).creation_email.deliver_now
      end  
    #   QuestMailer.creation_email(@quest).deliver_now
        redirect_to(questions_path,notice:"質問『#{@question.title}』の投稿が完了しました")
     else
      render(:new)
     end  
  end

  def index
    @questions=Question.page(params[:page]).per(5)
  end

  def show
    @question=Question.find(params[:id])
    @answer=Answer.new
  end

  def edit
    @question=Question.find(params[:id])
  end

  def update
    @question=Question.find(params[:id])
    #@question.is_solved = true  なんだこれ
    @question.update(question_params)
    redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def make_solved
    @question = Question.find(params[:id])
    @question.update(is_solved: true)
    redirect_to questions_path
    
  end

  def solved
    @questions=Question.where(is_solved:true)
  end

  def unsolved
    @questions=Question.where(is_solved:false)
  end


  private 

  def question_params
    params.require(:question).permit(:title,:content,:is_solved)
  end

  def set_q
    @q = Question.ransack(params[:q])
  end
  
end
