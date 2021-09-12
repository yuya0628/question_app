class Questions::SearchsController < ApplicationController

  before_action :set_q,only:[:index]
  

  def index
    @results = @q.result
  end


  private

  def set_q
    @q = Question.ransack(params[:q])
  end
end
