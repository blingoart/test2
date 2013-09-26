class OnboardingArtist < ActiveRecord::Base

  has_many :onboarding_images

  attr_accessible :first_name, :last_name, :licensing_permission, :signin_name, :password_digest, :bio, :photo

  mount_uploader :photo, OnboardingBioUploader

  has_secure_password

  validates :signin_name, :presence => true
  validates :password_digest, :presence => true, :on => :create

end
