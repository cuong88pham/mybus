class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :tenant_id
      t.string :name
      t.string :code
      t.string :photo
      t.boolean :is_valid,:default => true
      t.timestamps
    end
  end
end
