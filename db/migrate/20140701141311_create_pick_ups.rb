class CreatePickUps < ActiveRecord::Migration
  def change
    create_table :pick_ups do |t|
      t.string :place

      t.timestamps
    end
  end
end
