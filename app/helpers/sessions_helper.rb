module SessionsHelper
  def signed_in?
    !!current_member
  end

  def signed_out?
    !signed_in?
  end

  def sign_in(member)
    session[:member_id] = member.id
  end

  def sign_out
    session[:member_id] = nil
  end

  def require_signed_in
    unless signed_in?
      store_location
      redirect_to signin_path, :notice => "Please sign in to access this page"
    end
  end

  def require_signed_out
    redirect_to current_user if signed_in?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end

  def redirect_back_or_to(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def current_member=(member)
    @current_member = member
  end

  def current_member
    if session[:member_id]
      @current_member ||= Member.find_by_id(session[:member_id])
    end
    @current_member
  end

  private

    def member_from_remember_token
      Member.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
