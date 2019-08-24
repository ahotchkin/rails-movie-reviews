class ApplicationController < ActionController::Base

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  end

  def redirect_if_not_logged_in
  end

  helper_method :current_user

end
