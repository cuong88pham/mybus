class CreateBusDrivers < ActiveRecord::Migration
  def change
    create_table :bus_drivers do |t|
      t.integer :bus_id
      t.integer :driver_id

      t.timestamps
    end
  end
end
