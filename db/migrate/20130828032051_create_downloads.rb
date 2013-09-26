class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.references :pack
      t.references :app
      t.string :app_user_id
      t.decimal :pack_price
      t.integer :app_percentage_of_revenue
      t.integer :artist_percentage_of_revenue

      t.timestamps
    end
    add_index :downloads, :pack_id
    add_index :downloads, :app_id
  end
end
