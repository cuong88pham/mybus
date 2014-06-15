class Assignment < ActiveRecord::Base

  # Relationships
  belongs_to :user
  belongs_to :role

  validates :user_id, :uniqueness => {:scope => :role_id}

end
