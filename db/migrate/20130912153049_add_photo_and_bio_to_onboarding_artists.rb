class AddPhotoAndBioToOnboardingArtists < ActiveRecord::Migration
  def change
    add_column :onboarding_artists, :photo, :string, :after => :licensing_permission
    add_column :onboarding_artists, :bio, :text, :after => :licensing_permission
  end
end
