class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :threshold_1
      t.decimal :threshold_1_price
      t.integer :threshold_2
      t.decimal :threshold_2_price
      t.integer :threshold_3
      t.decimal :threshold_3_price

      t.timestamps
    end
  end
end
