class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :uniqueness => true
      t.string :desc
      t.timestamps
    end
    add_index :roles, :name, :unique => true
  end
end
