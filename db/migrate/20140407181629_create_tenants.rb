class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :domain
      t.string :schema
      t.string :address
      t.string :email
      t.string :logo
      t.string :phone
      t.string :contact_person
      t.boolean :is_valid, :default => true
      t.timestamps
    end
  end
end
