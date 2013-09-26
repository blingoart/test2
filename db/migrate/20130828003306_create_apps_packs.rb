class CreateAppsPacks < ActiveRecord::Migration
  def change
    create_table :apps_packs, :id => false do |t|
      t.references :app
      t.references :pack
      t.string :cover_image

      t.timestamps
    end
    add_index :apps_packs, :app_id
    add_index :apps_packs, :pack_id
  end
end
