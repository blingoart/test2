class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.string :title
      t.decimal :price
      t.string :cover_image
      t.boolean :available

      t.timestamps
    end
  end
end
