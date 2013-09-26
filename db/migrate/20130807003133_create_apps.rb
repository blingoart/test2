class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.references :client
      t.string :name
      t.string :api_password
      t.integer :thumbnail_sticker_width
      t.integer :thumbnail_sticker_height
      t.integer :actual_sticker_width
      t.integer :actual_sticker_height
      t.integer :percentage_of_revenue

      t.timestamps
    end
    add_index :apps, :client_id
  end
end
