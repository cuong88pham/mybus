class Station < ActiveRecord::Base


  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :location
  # Scope Get active station
  scope :actived, where(is_valid: true)

end
