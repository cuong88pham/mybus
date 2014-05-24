class AddSubSeatsToBusTrips < ActiveRecord::Migration
  def change
    add_column :bus_trips, :sub_seats, :integer
  end
end
