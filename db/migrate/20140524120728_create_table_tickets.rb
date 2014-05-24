class CreateTableTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :tenant_id
      t.integer :bus_trip_id
      t.string  :fullname
      t.string  :phone
      t.string  :email
      t.string  :password
      t.string  :promote_code
      t.string  :pick_up_at
      t.string  :status
    end
  end
end
