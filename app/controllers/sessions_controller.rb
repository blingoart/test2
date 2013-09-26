class SessionsController < ApplicationController
  before_filter :signed_in?, :only => [:delete]

  def new
    @title = "Sign in"
  end

  def create
    if member = Member.find_by_email(params[:session][:email]).try(:authenticate, params[:session][:password])
      session[:member_id] = member.id
      flash[:notice] = "You are now signed in"
      redirect_back_or_to(root_path) # Or whatever you want i.e. redirect_to member
    else
      flash.now[:error] = "Bad email and password combination"
      render :new
    end
  end

  def delete
    session.delete(:member_id)
    flash[:notice] = "You have been signed out"
    redirect_back_or_to(root_path)
  end
end
