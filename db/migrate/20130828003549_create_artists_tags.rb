class CreateArtistsTags < ActiveRecord::Migration
  def change
    create_table :artists_tags, :id => false do |t|
      t.references :artist
      t.references :tag

      t.timestamps
    end
    add_index :artists_tags, :artist_id
    add_index :artists_tags, :tag_id
  end
end
