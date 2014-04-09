class Bus < ActiveRecord::Base

  has_many :bus_movements

  validates :name, presence: true
  validates :code, uniqueness: true
  validates :seats, uniqueness: true

end
