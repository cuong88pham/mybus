class Role < ActiveRecord::Base

  validates :name,  presence: true,
                    uniqueness: true

  has_many :assignments, dependent: :destroy
  has_many :users, :through => :assignments
  has_many :roles_permissions, dependent: :destroy
  has_many :permissions, :through => :roles_permissions

  accepts_nested_attributes_for :permissions


end
