class Onboarding::OnboardingController < ApplicationController
  layout "onboarding/onboarding"

  include Onboarding::SessionsHelper
  helper_method :current_artist, :signed_in?, :signed_out?
  before_filter :require_artist_name
  before_filter :set_path_cookie

  private

  def require_artist_name
    if params.has_key?(:signin_name)
      @onboarding_artist = OnboardingArtist.find_by_signin_name(params[:signin_name])
      if @onboarding_artist.nil?
        redirect_to :root
      elsif session[:onboarding_artist_id]
        if session[:onboarding_artist_id] != @onboarding_artist.id
          redirect_to :onboarding_artist_signout
        end
      end
    end
  end

  def set_path_cookie
    cookies[:onboarding_page_previous_cookie] = cookies[:onboarding_page_current_cookie]
    cookies[:onboarding_page_current_cookie] = request.path
  end

end
