class Brand < ActiveRecord::Base
  has_many :bus_trips

  validates :name, presence: true
  validates :code, uniqueness: true

  # Get active brand
  scope :actived, where(is_valid: true)
end
