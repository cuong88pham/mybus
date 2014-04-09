class AddCurrentLocationToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :current_location, :integer
  end
end
