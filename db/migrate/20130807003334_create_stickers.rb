class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.references :artist
      t.references :brand
      t.string :file_name
      t.boolean :available

      t.timestamps
    end
    add_index :stickers, :artist_id
    add_index :stickers, :brand_id
  end
end
