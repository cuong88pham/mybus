class User < ActiveRecord::Base
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  STATUS = {
    'active'    => true,
    'deactive'  => false
  }

  has_many :assignments, dependent: :destroy
  has_many :roles, :through => :assignments
  has_many :permissions, :through => :roles

  accepts_nested_attributes_for :roles

  enumerize :status, in: STATUS

  # Set to be accessed in other Model
  def self.current
    Thread.current[:user]
  end

  def admin?
    self.roles.pluck(:name).include? 'admin'
  end
end
