class Onboarding::ImagesController < Onboarding::OnboardingController
  before_filter :get_files
  before_filter :require_signed_in, :except => [:show]
  before_filter :authenticate

  def create
    # if the upload data exists and the previous page was new or create then process the upload data
    if params.has_key?(:onboarding_image) && (cookies[:onboarding_page_previous_cookie] == onboarding_images_new_path || cookies[:onboarding_page_previous_cookie] == onboarding_images_create_path)
      temp_files = params[:onboarding_image][:file_name]
      temp_files.each do |temp_file|
        original_file_name = temp_file.original_filename
        temp_file_path = temp_file.tempfile.path
        extension = File.extname(original_file_name)
        if (extension == ".zip")
          require 'zip'
          begin
            Zip::File.open(temp_file_path) do |zipfile|
              zipfile.each do |entry|
                unless entry.name =~ /__MACOSX/ or entry.name =~ /\.DS_Store/ or !entry.file?
                  temp_unzip_dir = Rails.root.join("public", "uploads/tmp/#{@onboarding_artist.id}")
                  temp_unzip_dir_delete = temp_unzip_dir
                  temp_unzip_path = File.join(temp_unzip_dir.to_s, entry.name)
                  #check if the zip file contains a directory
                  zip_dir = File.dirname(entry.name)
                  if zip_dir and zip_dir != "."
                    temp_unzip_dir = File.join(temp_unzip_dir, "/#{zip_dir}")
                  end
                  unless File.directory?(temp_unzip_dir)
                    FileUtils.mkdir_p(temp_unzip_dir)
                  end
                  zipfile.extract(entry.name, temp_unzip_path)
                  new_file = File.open(temp_unzip_path)
                  @onboarding_image = create_new_file new_file
                  if @onboarding_image.save
                    #remove the temporary unzip directory that we created
                    FileUtils.remove_dir(temp_unzip_dir_delete)
                  else
                    processing_file_path = @onboarding_image.file_name.path
                    processing_file_directory = File.dirname(processing_file_path)
                    # remove the temporary directory that CarrierWave created
                    FileUtils.remove_dir(processing_file_directory)
                    #remove the temporary unzip directory that we created
                    FileUtils.remove_dir(temp_unzip_dir_delete)
                  end
                end
              end
            end
          rescue
            render :new
            return
          end
        else
          @onboarding_image = create_new_file temp_file
          unless @onboarding_image.save
            # remove the temporary directory that CarrierWave created for this file that is not automatically
            # deleted if the file was not able to be saved (for example, if the file is a duplicate)
            #@onboarding_image.remove_file_name!
            processing_file_path = @onboarding_image.file_name.path
            processing_file_directory = File.dirname(processing_file_path)
            FileUtils.remove_dir(processing_file_directory)
          end
        end
      end
    #  else call save to see error message for blank field
    elsif cookies[:onboarding_page_previous_cookie] == onboarding_images_new_path || cookies[:onboarding_page_previous_cookie] == onboarding_images_create_path
      @onboarding_image.save
    # else redirect to new so that clicking the browser Back button doesn't resubmit the form
    else
      redirect_to :onboarding_images_new
      return
    end
    render :new
  end

  def new
  end

  def show
    if signed_in?
      redirect_to :onboarding_images_new
    end
  end

  def edit
    begin
      @file = OnboardingImage.find(params[:id])
      @path = onboarding_images_new_path
    rescue
      redirect_to :onboarding_images_new
    end
  end

  def destroy
    begin
      @file = OnboardingImage.find(params[:id])
      @file.destroy
    rescue
    ensure
      redirect_to :onboarding_images_new
    end
  end

  def create_zip
    require 'zip'
    artist = OnboardingArtist.find_by_signin_name(params[:signin_name])
    zipfile_name = "public/uploads/#{artist.id}/#{artist.id}_all.zip"

    # create a zip outputstream and package all onboarding images
    Zip::OutputStream.open(zipfile_name) do |z|
      artist.onboarding_images.each do |img|
        title = img.file_name.to_s[9..-1]
        z.put_next_entry(title)
      end unless artist.onboarding_images.empty?
    end

    send_file( zipfile_name, :type =>'application/zip', :disposition => 'attachment' )

  end

  private

  def create_new_file(file_name)
    OnboardingImage.new(:file_name => file_name, :onboarding_artist_id => @onboarding_artist.id)
  end

  def get_files
    unless @onboarding_artist.nil?
      @onboarding_image = OnboardingImage.new
      @files = OnboardingImage.where(:onboarding_artist_id => @onboarding_artist.id).order('created_at DESC')
    end
  end



end