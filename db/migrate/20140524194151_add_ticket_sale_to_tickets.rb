class AddTicketSaleToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_sale, :string
  end
end
