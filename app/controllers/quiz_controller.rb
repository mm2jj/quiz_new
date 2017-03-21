class QuizController < ApplicationController
  before_filter :check_game_state, only: [:welcome]
  before_filter :check_join_code, only: [:index]

  def welcome
    @@in_progress = true
  end

  def index
    code = params[:code] || SecureRandom.hex(10)
    unless current_user
      user = User.create(code: code)
      set_current_user(user)
    end
  end

  def start
    @user = current_user
    @users = User.all
    @user.update(name: params[:character]) if params[:character]

    total = 3
    all = Question.all.map {|x| x.id}
    session[:questions] = all.sort_by{rand}[0..(total-1)]
    session[:total] = total
    session[:current] = 0
    session[:correct] = 0
  end

  def question

  end

  def join
  end

  def refresh_users
    @users = User.all

    respond_to do |format|
      format.js
    end
  end

  def end
    User.delete_all
    destroy_user_session
    @@in_progress = false
  end

  private

  def check_game_state
    redirect_to action: 'join' and return if @@in_progress && !current_user
    redirect_to action: 'index' if @@in_progress && current_user
  end

  def check_join_code
    if params[:code]
      user = User.find_by(code: params[:code])
      unless user
        redirect_to action: 'join', notice: "wrong code" and return
      end
    end
  end
end
