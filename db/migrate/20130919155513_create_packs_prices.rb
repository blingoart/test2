class CreatePacksPrices < ActiveRecord::Migration
  def change
    create_table :packs_prices do |t|
      t.references :pack
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
    add_index :packs_prices, :pack_id
  end
end
