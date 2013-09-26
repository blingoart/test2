class CreateArtistsPacksPercentage < ActiveRecord::Migration
  def change
    create_table :artists_packs_percentage do |t|
      t.references :artist
      t.references :pack
      t.integer :percentage_of_revenue
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
    add_index :artists_packs_percentage, [:artist_id, :pack_id]
  end
end
