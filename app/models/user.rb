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

  has_and_belongs_to_many :roles

  enumerize :status, in: STATUS

  # Set to be accessed in other Model
  def self.current
    Thread.current[:user]
  end

  def admin?
    self.roles.pluck(:name).include? 'admin'
  end

end
