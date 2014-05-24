class AddPriceTicketToBusTrips < ActiveRecord::Migration
  def change
    add_column :bus_trips, :price_ticket, :float
  end
end
