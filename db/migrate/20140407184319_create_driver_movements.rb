class CreateDriverMovements < ActiveRecord::Migration
  def change
    create_table  :driver_movements do |t|
      t.integer   :tenant_id
      t.integer   :bus_movement_id
      t.integer   :driver_id
      t.datetime  :movement_dt

      t.timestamps
    end
  end
end
