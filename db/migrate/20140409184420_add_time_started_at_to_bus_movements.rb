class AddTimeStartedAtToBusMovements < ActiveRecord::Migration
  def change
    add_column :bus_movements, :time_started_at, :time
  end
end
