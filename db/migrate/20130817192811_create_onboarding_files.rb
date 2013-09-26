class CreateOnboardingFiles < ActiveRecord::Migration
  def change
    create_table :onboarding_files do |t|
      t.references :onboarding_artist
      t.string :file_name

      t.timestamps
    end
    add_index :onboarding_files, :onboarding_artist_id
  end
end
