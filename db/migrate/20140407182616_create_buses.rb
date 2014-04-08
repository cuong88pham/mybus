class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.integer :tenant_id
      t.string   :name
      t.string   :code
      t.string   :status
      t.boolean  :is_valid,:default => true
      t.integer  :seats

      t.timestamps
    end
  end
end
