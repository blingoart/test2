class ChangeDownloadsPackPrice < ActiveRecord::Migration
  def up
      change_column :downloads, :pack_price, :decimal, :precision => 8, :scale => 2
    end

    def down
      change_column :downloads, :pack_price, :decimal, :precision => 10, :scale => 0
    end
end
