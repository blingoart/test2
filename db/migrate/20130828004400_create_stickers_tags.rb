class CreateStickersTags < ActiveRecord::Migration
  def change
    create_table :stickers_tags, :id => false do |t|
      t.references :sticker
      t.references :tag

      t.timestamps
    end
    add_index :stickers_tags, :sticker_id
    add_index :stickers_tags, :tag_id
  end
end
