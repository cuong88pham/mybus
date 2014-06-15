class CreateRolesPermissions < ActiveRecord::Migration
  def change
    create_table :roles_permissions do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps
    end
    add_index :roles_permissions, [:permission_id,:role_id]
  end
end
