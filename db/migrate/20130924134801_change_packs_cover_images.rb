class ChangePacksCoverImages < ActiveRecord::Migration
  def up
    remove_column :packs, :cover_image
    remove_column :apps_packs, :cover_image
    add_column :apps_packs, :cover_image_override, :boolean, :after => :pack_id
  end

  def down
    add_column :packs, :cover_image, :string, :after => :price
    add_column :apps_packs, :cover_image, :string, :after => :pack_id
    remove_column :apps_packs, :cover_image_override
  end
end
