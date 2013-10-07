class ChangeNullableForTimestampsOnArtistsPacks < ActiveRecord::Migration
  def change
    change_column :artists_packs, :created_at, :datetime, :null => true
    change_column :artists_packs, :updated_at, :datetime, :null => true
  end
end
