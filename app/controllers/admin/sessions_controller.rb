class Admin::SessionsController < ApplicationController
  before_filter :authenticate

  def new
    redirect_to(admin_dashboard_index_path) if @admin.present?
  end

  def create
    @admin = Admin.find_by_username(params[:username])
    if @admin.present? && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_index_path
    else
      flash[:notice] = "Incorrect username and password"
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end

end