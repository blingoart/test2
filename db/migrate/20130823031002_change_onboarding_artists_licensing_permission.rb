class ChangeOnboardingArtistsLicensingPermission < ActiveRecord::Migration
  def up
    change_column :onboarding_artists, :licensing_permission, :datetime
  end
  def down
    change_column :onboarding_artists, :licensing_permission, :tinyint
  end
end
