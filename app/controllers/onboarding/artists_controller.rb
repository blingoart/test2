class Onboarding::ArtistsController < Onboarding::OnboardingController
  before_filter :require_signed_in

  def create
    if params.has_key?(:onboarding_artist)
      if params[:onboarding_artist].has_key?(:photo)
        temp_file = params[:onboarding_artist][:photo]
        original_file_name = temp_file.original_filename
        temp_file_path = temp_file.tempfile.path
        extension = File.extname(original_file_name)
        @onboarding_artist.photo = temp_file
      end
      @onboarding_artist.bio = params[:onboarding_artist][:bio]
      unless @onboarding_artist.save
        # remove the temporary directory that CarrierWave created for this file that is not automatically
        # deleted if the file was not able to be saved (for example, if the file is a duplicate)
        #@onboarding_file.remove_file_name!
        processing_file_path = @onboarding_artist.photo.path
        processing_file_directory = File.dirname(processing_file_path)
        FileUtils.remove_dir(processing_file_directory)
      end
    end
    redirect_to :onboarding_artist_show
  end

  def show
  end

  def destroy_photo
    begin
      @onboarding_artist.remove_photo!
      @onboarding_artist.save
    rescue
    ensure
      redirect_to :onboarding_artist_show
    end
  end

  def legal
  end

  def signin_create
    @signin = OnboardingArtist.find_by_signin_name(params[:signin_name])
    @signin.password = "test 1";
    #@signin.update_attributes(params[:onboarding_artist])
    @signin.save
    render nothing: true
  end

end
