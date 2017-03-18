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
    @user.save(name: params[:character])
  end

  def join
  end

  def end
    User.delete_all
    destroy_user_session
    @@in_progress = false
  end

  private

  def check_game_state
    redirect_to action: 'join' if @@in_progress && !current_user
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
