class CreatePermissionsRoles < ActiveRecord::Migration
  def change
    create_table :permissions_roles, id: false do |t|
      t.belongs_to :role
      t.belongs_to :permission
    end
  end
end
