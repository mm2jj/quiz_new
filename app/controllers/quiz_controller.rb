class QuizController < ApplicationController
  before_filter :get_group, except: [:welcome, :join, :index]
  before_filter :check_group, only: [:index]

  def welcome
    invalidate_session
  end

  def join
  end

  def index
    if params[:code]
      @group = Group.find_by(code: params[:code])
    else
      @group = Group.create(code: SecureRandom.hex(10))
    end
    set_current_group(@group)
  end

  def start
    user_params = {}
    user_params[:name] = params[:character] if params[:character]
    @user = User.create(user_params)
    @group.users << @user
    set_current_user(@user)

    @users = @group.users
    questions = Question.all
    total = questions.count
    all = questions.map {|x| x.id}
    session[:questions] = all.sort_by{rand}[0..(total-1)]
    session[:total] = total
    session[:current] = 0
    session[:correct] = 0
  end

  def question
  end


  def refresh_users
    @users = @group.users

    respond_to do |format|
      format.js
    end
  end

  def end
    @group.users.delete_all
    destroy_user_session
    destroy_group_session
  end

  private

  def get_group
    @group = current_group
  end

  def check_group
    if params[:code]
      group = Group.find_by(code: params[:code])
      redirect_to action: 'welcome', error: 'wrong code' unless group
    end
  end
end
