class ArtistsPacksRemoveArtistPercent < ActiveRecord::Migration
  def up
    remove_column :artists_packs, :artist_percent
  end

  def down
    add_column :artists_packs, :artist_percent, :integer
  end

end
