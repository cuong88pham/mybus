class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.integer :tenant_id
      t.string   :name
      t.string   :color

      t.timestamps
    end
  end
end
