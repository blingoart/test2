class ChangeOnboardingFilesTableName < ActiveRecord::Migration
  def change
    rename_table :onboarding_files, :onboarding_images
  end
end
