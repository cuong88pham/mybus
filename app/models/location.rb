class Location < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :code, uniqueness: true, uniqueness: true

  has_many :stations

end
