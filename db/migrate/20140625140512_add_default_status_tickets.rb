class AddDefaultStatusTickets < ActiveRecord::Migration
  def change
    change_column :tickets, :status, :string, :default => '003'
  end
end
