class ApplicationController < ActionController::Base
  protect_from_forgery


  # def authenticate
  #   if session[:admin_id].present?
  #     @admin = Admin.find(session[:admin_id])
  #   # else
  #   #   redirect_to admin_login_path
  #   end
  # end
end
