class OnboardingImage < ActiveRecord::Base

  belongs_to :onboarding_artist

  attr_accessible :file_name, :onboarding_artist_id

  mount_uploader :file_name, OnboardingFilesUploader

  #validates :onboarding_artist_id, :presence => true
  validates :file_name, :presence => {:message => "There is no file selected for uploading."}
  validate :unique_file_name, :on => :create

  before_create :set_content_type

  def unique_file_name
    unless file_name.original_file.nil?
      @count = OnboardingImage.where(:file_name => file_name.original_file).count
      if @count != 0
        errors.add(:base, "This file has already been uploaded.")
      end
    end
  end

  def set_content_type
    self.content_type = file_name.file.content_type
  end

end
