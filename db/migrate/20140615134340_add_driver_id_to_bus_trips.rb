class AddDriverIdToBusTrips < ActiveRecord::Migration
  def change
    add_column :bus_trips, :driver_id, :integer
  end
end
