class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  def set_current_group(group)
    session[:group_id] = group.id
  end

  def current_group
    return nil if session[:group_id].nil?
    @current_group ||= Group.find_by(id: session[:group_id])
  end

  def destroy_group_session
    session[:group_id] = nil
  end

  def invalidate_session
    user = current_user
    group = current_group
    user.destroy if user
    group.destroy if group

    destroy_user_session
    destroy_group_session
  end
end
