class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :tenant_id
      t.string     :fullname
      t.string     :address
      t.string     :email
      t.string     :phone
      t.integer    :status
      t.timestamps :created_at
      t.timestamps :updated_at
      t.timestamps
    end
  end
end
