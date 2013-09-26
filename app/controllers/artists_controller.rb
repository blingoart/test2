class ArtistsController < ApplicationController

  def index
    @title = "Home"
    @artists = Artist.order('created_at DESC')
    #render :layout => 'homepage'
  end

end
