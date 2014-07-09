class Bus < ActiveRecord::Base

  belongs_to :tenant
  has_many :bus_trips

  validates :name, presence: true
  validates :code, uniqueness: true
  validates :seats, presence: true
  scope :by_tenant, lambda{|tenant_id| where(tenant_id: tenant_id) unless tenant_id.blank?}
  TYPES = {
    'Có giường nằm' => 1,
    'Xe bình thường' => 0
  }

end
