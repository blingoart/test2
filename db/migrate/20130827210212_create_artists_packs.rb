class CreateArtistsPacks < ActiveRecord::Migration
  def change
    create_table :artists_packs, :id => false do |t|
      t.references :artist
      t.references :pack
      t.integer :artist_percent

      t.timestamps
    end
    add_index :artists_packs, :artist_id
    add_index :artists_packs, :pack_id
  end
end
