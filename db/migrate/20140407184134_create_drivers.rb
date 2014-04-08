class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :tenant_id
      t.string  :name
      t.string  :code
      t.string  :address
      t.string  :phone
      t.integer :driver_type
      t.boolean :is_valid,:default =>true

      t.timestamps
    end
  end
end
