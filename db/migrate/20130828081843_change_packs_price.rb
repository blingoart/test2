class ChangePacksPrice < ActiveRecord::Migration
  def up
      change_column :packs, :price, :decimal, :precision => 8, :scale => 2
    end

    def down
      change_column :packs, :price, :decimal, :precision => 10, :scale => 0
      end
end
