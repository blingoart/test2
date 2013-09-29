class Admin::DashboardController < ApplicationController
  before_filter :authenticate

  def index
    @onboarding_artists = OnboardingArtist.order_by_signin_name
  end

  # authenticate is now located in the top-level ApplicationController
  # private
  def authenticate
    @admin = Admin.find(session[:admin_id]) if session[:admin_id].present?
    redirect_to root_path if @admin.nil?
  end

end