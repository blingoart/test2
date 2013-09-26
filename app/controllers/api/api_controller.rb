class Api::ApiController < ApplicationController
  # Notes: since packs have 1 or more artists and possibly a brand at the same time, and stickers also have artists,
  # do we have to include the artist name in the API response at the sticker level?
  before_filter :require_app_authorization

  respond_to :html, :json

  def packs
    packs = @app.packs.select("id, title, price, apps_packs.cover_image_override")
      if packs
        packs.each do |pack|
          cover_image = cover_image_url(pack.cover_image_override, pack.id)
          #cover_image = pack.override ? pack.override : pack.cover_image
          #cover_image_url = URI.join(root_url, cover_image_path(cover_image, pack.id)).to_s
          pack_price = pack.packs_prices.select("id, price").where(pack_id: pack.id).where("start_date <= ?", Time.zone.now).where("end_date >= ?", Time.zone.now).first
          if pack_price.nil?
            pack_price = pack.packs_prices.select("id, price").where(pack_id: pack.id).last
          end
          stickers = pack.stickers
          stickers_count = stickers.count
          artists = pack.artists.select("first_name, last_name")
          unless stickers_count == 0
            @data << Hash["sticker_pack_id" => pack.id, "sticker_pack_title" => pack.title, "sticker_pack_price" => pack_price.price, "sticker_pack_price_id" => pack_price.id, "sticker_pack_cover_image" => cover_image, "sticker_count" => stickers_count, "artists" => artists]
          end
        end
      else
        respond_with_error
      end
    respond_with(@data)
  end

  def stickers
    if params.has_key?(:pid)
      pack_id = params[:pid]
      pack = @app.packs.select("id, title, price, apps_packs.cover_image_override").where(id: pack_id).first
      stickers = pack.stickers
      if stickers
        stickers_count = stickers.count
        cover_image = cover_image_url(pack.cover_image_override, pack.id)
        artists = pack.artists.select("first_name, last_name")
        @data << Hash["sticker_pack_id" => pack.id, "sticker_pack_title" => pack.title, "sticker_pack_cover_image" => cover_image, "sticker_count" => stickers.count, "artists" => artists]
        data_stickers = Array.new
        stickers.each do |sticker|
          if sticker.artist_id
            artist = Artist.select("first_name, last_name").where(id: sticker.artist_id)
            sticker_image = sticker_url(sticker.file_name, "artists", sticker.artist_id)
            data_stickers << Hash["sticker_artist" => artist, "sticker_image" => sticker_image]
          elsif sticker.brand_id
            sticker_image = sticker_url(sticker.file_name, "brands", sticker.brand_id)
            data_stickers << Hash["sticker_image" => sticker_image]
          end
        end
        @data << data_stickers
        respond_with(@data)
      end
    else
      respond_with_error
    end
  end

  def download
    # record transaction in downloads table in db
    if params.has_key?(:pid) && params.has_key?(:prcid)
      pack_id = params[:pid]
      pack_price_id = params[:prcid]
      @download = Download.new
      @download.pack_id = pack_id
      @download.app_id = @app_id
      @download.pack_price_id = pack_price_id
      if params.has_key?(:uid)
        @download.app_user_id = params[:uid]
      end
      @download.save
      @data << Hash["success" => true, "id" => @download.id]
      respond_with(@data)
    else
      respond_with_error
    end
  end

  def sticker_data
  end

  def cover_image_url(cover_image_override, pack_id)
    cover_image = "cover.png"
    if cover_image_override
      cover_image_path = "packs/#{pack_id}/#{@app_id}/#{cover_image}"
    else
      cover_image_path = "packs/#{pack_id}/#{cover_image}"
    end
    URI.join(root_url, cover_image_path).to_s
  end

  def sticker_url(file_name, creator, creator_id)
    #@extension = File.extname(file_name.to_s).sub(/\./, '')
    #@find_me = "." + @extension
    #@replace_me = "_thumbnail" + @find_me
    #file_name.sub! @find_me, @replace_me
    sticker_path = "stickers/#{creator}/#{creator_id}/#{file_name}"
    URI.join(root_url, sticker_path).to_s
  end

  def require_app_authorization
    @data = Array.new
    if params.has_key?(:a) and params.has_key?(:k)
      @app_id = params[:a]
      @api_password = params[:k]
      @app = App.where(id: @app_id, api_password: @api_password).first
      unless @app
        respond_with_error
      end
    else
      respond_with_error
    end
  end

  def respond_with_error
    @data << Hash["error" => true]
    respond_with(@data)
  end

end
