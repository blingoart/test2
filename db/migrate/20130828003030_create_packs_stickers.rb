class CreatePacksStickers < ActiveRecord::Migration
  def change
    create_table :packs_stickers, :id => false do |t|
      t.references :pack
      t.references :sticker

      t.timestamps
    end
    add_index :packs_stickers, :pack_id
    add_index :packs_stickers, :sticker_id
  end
end
