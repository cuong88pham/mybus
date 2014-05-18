class Post < ActiveRecord::Base
  include Codeable
  before_save :make_alias_slug

  scope :main_nav, where(show_in_main_nav: true)
  scope :front_page, where(show_in_home_page: true)
  scope :footer, where(show_in_footer: true)

  def to_param
    slug = self.alias
    "#{id} #{slug}".parameterize
  end

  private
  def make_alias_slug
    self.alias = self.title.to_slug.transliterate(:vietnamese).normalize.to_s
  end
end
