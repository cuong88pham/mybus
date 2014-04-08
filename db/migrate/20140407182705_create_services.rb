class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :tenant_id
      t.string   :name
      t.boolean  :is_valid,:default => true

      t.timestamps
    end
  end
end
