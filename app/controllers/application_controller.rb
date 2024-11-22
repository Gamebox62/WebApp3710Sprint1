class ApplicationController < ActionController::Base
    helper_method :current_admin, :logged_in?
  
    def current_admin
      @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end
  
    def logged_in?
      current_admin.present?
    end
  
    def require_login
      unless logged_in?
        redirect_to new_session_path, alert: "You must be logged in to access this page."
      end
    end
  end