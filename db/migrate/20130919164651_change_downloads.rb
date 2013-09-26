class ChangeDownloads < ActiveRecord::Migration
  def up
    add_column :downloads, :pack_price_id, :integer, :after => :app_id
    add_index :downloads, :pack_price_id
    remove_column :downloads, :pack_price,:app_percentage_of_revenue,:artist_percentage_of_revenue
  end

  def down
    add_column :downloads, :pack_price, :decimal, :precision => 8, :scale => 2, :after => :app_user_id
    add_column :downloads, :app_percentage_of_revenue, :integer, :after => :pack_price
    add_column :downloads, :artist_percentage_of_revenue, :integer, :after => :app_percentage_of_revenue
    remove_column :downloads, :pack_price_id
  end
end
