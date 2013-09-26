class CreatePacksTags < ActiveRecord::Migration
  def change
    create_table :packs_tags, :id => false do |t|
      t.references :pack
      t.references :tag

      t.timestamps
    end
    add_index :packs_tags, :pack_id
    add_index :packs_tags, :tag_id
  end
end
