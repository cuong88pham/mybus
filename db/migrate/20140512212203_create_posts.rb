class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.integer :category_id
      t.string  :alias
      t.text    :post_content
      t.string  :post_desc
      t.string  :meta_desc
      t.string  :meta_key
      t.boolean :show_in_home_page, default: false
      t.boolean :show_in_main_nav, default: false
      t.boolean :show_in_footer, default: false
      t.boolean :status, default: true
      t.timestamps :publish_at
      t.timestamps
    end
  end
end
