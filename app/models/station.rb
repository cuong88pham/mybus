class Station < ActiveRecord::Base


  validates :name, presence: true
  validates :code, uniqueness: true

  # Scope Get active station
  scope :actived, where(is_valid: true)

end
