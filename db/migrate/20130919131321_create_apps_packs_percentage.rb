class CreateAppsPacksPercentage < ActiveRecord::Migration
  def change
    create_table :apps_packs_percentage do |t|
      t.references :app
      t.references :pack
      t.integer :percentage_of_revenue
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
    add_index :apps_packs_percentage, [:app_id, :pack_id]
  end
end
