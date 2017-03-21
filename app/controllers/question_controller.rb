class QuestionController < ApplicationController
  def index
  end

  def question
    @current = session[:current]
    @total = session[:total]
    if @current >= @total
      redirect_to :action => "end"
      return
    end
    @question = Question.find_by(id: session[:questions][@current])
    @choices = @question.answers.sort_by{rand}
    session[:question] = @question
    session[:choices] = @choices
  end



  def show
  end
end
