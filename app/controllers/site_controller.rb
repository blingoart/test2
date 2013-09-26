class SiteController < ApplicationController
  respond_to :html, :js

  def index
    @title = "Home"
    render :layout => 'homepage'
  end

  def prelaunch
    #render nothing: true
    if params.has_key?(:email)
      @prelaunch = Prelaunch.new(:email => params[:email])
      @count = Prelaunch.where(:email => params[:email]).count
      #if @count == 0
      if @prelaunch.is_unique?
        #@prelaunch = Prelaunch.new(:email => params[:email])
        @prelaunch.save
      end
    end
    #respond_with("prelaunch")
  end

end