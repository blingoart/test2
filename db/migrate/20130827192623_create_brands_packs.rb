class CreateBrandsPacks < ActiveRecord::Migration
  def change
    create_table :brands_packs, :id => false do |t|
      t.references :brand
      t.references :pack

      t.timestamps
    end
    add_index :brands_packs, :brand_id
    add_index :brands_packs, :pack_id
  end
end
