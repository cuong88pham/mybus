class Driver < ActiveRecord::Base

  has_many :driver_movements
  belongs_to :tenant
  belongs_to :bus_driver
  scope :by_tenant, lambda{|tenant_id| where(tenant_id: tenant_id) unless tenant_id.blank?}
  # Constants
  TYPES = {
    'Tài xế' => 1,
    'Tiếp viên' => 2
  }


end
