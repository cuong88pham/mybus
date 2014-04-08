class Brand < ActiveRecord::Base
  has_many :bus_trips

  validates :name, presence: true
  validates :code, uniqueness: true

end
