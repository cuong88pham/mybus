class ChangePostDescStringToText < ActiveRecord::Migration
  def change
    change_column :posts, :post_desc, :text
  end
end
