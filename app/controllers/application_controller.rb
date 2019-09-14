class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :sort_direction

  private
    def current_user
      current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect_to root_path if !logged_in?
    end

    def redirect_if_logged_in
      redirect_to user_path(current_user) if logged_in?
    end

    def redirect_if_not_admin
      redirect_to user_path(current_user) if !current_user.admin
    end

    def sort_direction
      %w[asc, desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
