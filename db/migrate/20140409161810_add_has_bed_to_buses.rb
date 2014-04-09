class AddHasBedToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :has_bed, :integer, :default => 0
  end
end
