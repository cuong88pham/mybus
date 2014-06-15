class RolesPermission < ActiveRecord::Base

  validates :permission_id, :uniqueness => {:scope => :role_id}

  # Relationships
  belongs_to :permission
  belongs_to :role
end
