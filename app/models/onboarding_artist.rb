# == Schema Information
#
# Table name: onboarding_artists
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  signin_name          :string(255)
#  password_digest      :string(255)
#  licensing_permission :datetime
#  bio                  :text
#  photo                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class OnboardingArtist < ActiveRecord::Base
  scope :order_by_signin_name,  order(:signin_name)
  scope :order_by_date_created, order(:created_at)

  has_many :onboarding_images

  attr_accessible :first_name, :last_name, :licensing_permission, :signin_name, :password, :password_confirmation, :bio, :photo, :created_at
  mount_uploader :photo, OnboardingBioUploader

  has_secure_password

  validates :signin_name, :presence => true
  validates :password_digest, :presence => true, :on => :create


  def date_created
    self.created_at.strftime "%m/%d/%Y %l:%M%P"
  end

end
