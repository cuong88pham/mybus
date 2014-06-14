class Bus < ActiveRecord::Base

  has_many :bus_movements
  has_many :driver_movements
  belongs_to :tenant
  has_many :bus_drivers

  validates :name, presence: true
  validates :code, uniqueness: true
  validates :seats, presence: true
  scope :by_tenant, lambda{|tenant_id| where(tenant_id: tenant_id) unless tenant_id.blank?}
  accepts_nested_attributes_for :bus_drivers
  TYPES = {
    'Có giường nằm' => 1,
    'Xe bình thường' => 0
  }

end
