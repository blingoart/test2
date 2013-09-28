class ApplicationController < ActionController::Base
  protect_from_forgery


  def authenticate
    if session[:admin_id].present?
      @admin = Admin.find(session[:admin_id])
    end
  end
end
