class CreateOnboardingArtists < ActiveRecord::Migration
  def change
    create_table :onboarding_artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :signin_name
      t.string :password_digest
      t.boolean :licensing_permission

      t.timestamps
    end
  end
end
