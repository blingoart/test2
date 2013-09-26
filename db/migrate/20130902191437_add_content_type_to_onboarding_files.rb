class AddContentTypeToOnboardingFiles < ActiveRecord::Migration
  def change
    add_column :onboarding_files, :content_type, :string, :after => :file_name
  end
end
