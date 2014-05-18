class PostsController < InheritedResources::Base
  assign_params :title, :alias, :post_desc, :post_content, :meta_desc,
                :meta_key, :show_in_home_page, :show_in_main_nav, :show_in_footer

  private
  def collection
    @posts = Post.all
  end
end
