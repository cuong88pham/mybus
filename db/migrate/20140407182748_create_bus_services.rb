class CreateBusServices < ActiveRecord::Migration
  def change
    create_table :bus_services do |t|
      t.integer :tenant_id
      t.integer  :bus_id
      t.integer  :service_id

      t.timestamps
    end
  end
end
