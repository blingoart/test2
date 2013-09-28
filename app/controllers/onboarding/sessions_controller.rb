class Onboarding::SessionsController < ApplicationController

  include Onboarding::SessionsHelper
  helper_method :current_artist, :signed_in?, :signed_out?, :require_signed_in

  before_filter :check_for_cancel
  before_filter :signed_in?, :only => [:delete]
  def new
    @title = "Sign in"
  end

  def create
    @redirect = onboarding_images_new_path
    @onboarding_artist = OnboardingArtist.find_by_signin_name(params[:signin_name])
    if @onboarding_artist.authenticate(params[:password])
      if @onboarding_artist.licensing_permission.nil?
        if params.has_key?(:licensing_permission)
          @onboarding_artist.licensing_permission = Time.now
          @onboarding_artist.save
          #@onboarding_artist.update_attribute(:licensing_permission, Time.now)
          successful_login
        else
          flash[:error] = "Please accept the terms and conditions."
          @redirect = onboarding_images_path
        end
      else
        successful_login
      end
    else
      flash[:error] = "Unknown name and password combination."
      @redirect = onboarding_images_path
    end
    redirect_to @redirect

  end

  def successful_login
    session[:onboarding_artist_id] = @onboarding_artist.id
    flash[:notice] = "You are now signed in."
    @redirect = onboarding_images_new_path
  end

  def destroy
    session.delete(:onboarding_artist_id)
    flash[:notice] = "You have been signed out."
    redirect_to onboarding_images_path
    #redirect_back_or_to(root_path)
  end

  def check_for_cancel
    if params[:commit] == "Cancel"
      flash[:error] = "Please accept the terms and conditions."
      redirect_to onboarding_images_path
    end
  end

end
