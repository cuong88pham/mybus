class CreateBusTrips < ActiveRecord::Migration
  def change
    create_table :bus_trips do |t|
      t.integer :tenant_id
      t.string :name
      t.string :code
      t.integer :from_station_id
      t.integer :to_station_id
      t.string :photo
      t.string :desc
      t.integer :position
      t.datetime :started_at
      t.integer :duration
      t.boolean :is_valid,:default => true
      t.integer :brand_id

      t.timestamps
    end
  end
end
