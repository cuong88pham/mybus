class Driver < ActiveRecord::Base

  has_many :driver_movements

  # Constants
  TYPES = {
    'Tài xế' => 1,
    'Tiếp viên' => 2
  }



end
