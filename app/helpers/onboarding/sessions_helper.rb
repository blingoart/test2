module Onboarding::SessionsHelper

  def signed_in?
    !!current_artist
  end

  def signed_out?
    !signed_in?
  end

  def sign_in(onboarding_artist)
    session[:onboarding_artist_id] = onboarding_artist.id
  end

  def sign_out
    session[:onboarding_artist_id] = nil
  end

  def require_signed_in
    unless signed_in?
      #store_location
      redirect_to onboarding_images_path, :notice => "Please sign in to access this page"
    end
  end

  def require_signed_out
    redirect_to current_artist if signed_in?
  end

  def store_location
    session[:onboarding_return_to] = request.fullpath
  end

  def clear_return_to
    session[:onboarding_return_to] = nil
  end

  def redirect_back_or_to(default)
    redirect_to(session[:onboarding_return_to] || default)
    clear_return_to
  end

  def current_artist=(onboarding_artist)
    @current_artist = onboarding_artist
  end

  def current_artist
    if session[:onboarding_artist_id]
      @current_artist ||= OnboardingArtist.find_by_id(session[:onboarding_artist_id])
    end
    @current_artist
  end

  private

    def artist_from_remember_token
      OnboardingArtist.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

end
