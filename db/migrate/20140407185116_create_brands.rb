class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :code
      t.integer :tenant_id
      t.boolean :is_valid,:default => true

      t.timestamps
    end
  end
end
