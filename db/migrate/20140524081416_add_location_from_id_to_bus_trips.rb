class AddLocationFromIdToBusTrips < ActiveRecord::Migration
  def change
    add_column :bus_trips, :location_from_id, :integer
    add_column :bus_trips, :location_to_id, :integer
    add_column :bus_trips, :bus_id, :integer
  end
end
