class CreateTickets < ActiveRecord::Migration
  def change
    create_table  :tickets do |t|
      t.integer   :tenant_id
      t.integer   :bus_movement_id
      t.integer   :customer_id
      t.integer   :status
      t.float     :price
      t.float     :discount
      t.integer   :ticket_type_id

      t.timestamps
    end
  end
end
