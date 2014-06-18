class Station < ActiveRecord::Base


  validates :name, presence: true
  validates :code, uniqueness: true

  belongs_to :location
  has_many :bus_trips
  # Scope Get active station
  scope :actived, where(is_valid: true)
  scope :by_tenant, lambda{|tenant_id| where(tenant_id: tenant_id) unless tenant_id.blank?}
end
