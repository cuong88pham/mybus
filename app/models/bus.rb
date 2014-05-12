class Bus < ActiveRecord::Base

  has_many :bus_movements
  has_many :driver_movements

  validates :name, presence: true
  validates :code, uniqueness: true
  validates :seats, uniqueness: true

  TYPES = {
    'Có giường nằm' => 1,
    'Xe bình thường' => 0
  }

end
