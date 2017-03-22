class QuestionController < ApplicationController
  def index
  end

  def show
    @current = session[:current]
    @total = session[:total]
    if @current >= @total
      redirect_to :action => "end"
      return
    end
    @question = Question.find_by(id: session[:questions][@current])
    @choices = @question.answers.sort_by{rand}
    session[:question_id] = @question.id
    session[:choices] = @choices
  end

  def answer
    @current = session[:current]
    @total = session[:total]
    choiceid = params[:choice]
    @question = Question.find_by(id: session[:question_id])
    @choices = session[:choices]
    @choice = choiceid ? Answer.find_by(id: choiceid) : nil
    if @choice and @choice.correct
      @correct = true
      session[:correct] += 1
    else
      @correct = false
    end
    session[:current] += 1
  end

  def end
    @correct = session[:correct]
    @total = session[:total]
    @score = @correct * 100 / @total
    user = current_user
    user.update(score: @score)
  end

  def result
    @users = User.all
    @@in_progress = false
  end
end
