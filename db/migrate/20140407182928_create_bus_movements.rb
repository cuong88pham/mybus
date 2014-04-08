class CreateBusMovements < ActiveRecord::Migration
  def change
    create_table :bus_movements do |t|
      t.integer :tenant_id
      t.integer  :bus_trip_id
      t.string   :code
      t.datetime :started_at
      t.integer  :bus_id
      t.integer  :can_book_before
      t.integer  :status

      t.timestamps
    end
  end
end
