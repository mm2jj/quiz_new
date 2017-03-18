class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @@in_progress = false

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def current_user
    return nil if session[:user_id].nil?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def destroy_user_session
    session[:user_id] = nil
  end
end
