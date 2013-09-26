class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :percentage_of_revenue

      t.timestamps
    end
  end
end
