class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :posts, :meta_desc, :text
    change_column :posts, :meta_key, :text
  end
end
