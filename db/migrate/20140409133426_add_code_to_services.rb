class AddCodeToServices < ActiveRecord::Migration
  def change
    add_column :services, :code, :string
  end
end
