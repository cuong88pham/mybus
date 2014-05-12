class Tenant < ActiveRecord::Base
  extend Enumerize
  include DefaultJob

  before_destroy :drop_schema
  before_create :set_schema
  after_create :create_schema, :set_admin_user

  IS_VALID = [
      :yes => true,
      :no  => false
    ]

  # Set enumerize is_valid field
  enumerize :is_valid, in: IS_VALID

  private

  # Set Schema Before Create Tenant
  #
  # Author Cuong pham
  def set_schema
    self.schema = self.domain.split('.')[0]
  end


  # Set Default Admin After Created Tenant
  #
  # Author Cuong Pham
  def set_admin_user
    params = {:schema => self.schema, :email => self.email}
    self.set_admin(params)
  end

  #Create Schema after Created Tenant
  #
  # Author Cuong Pham
  def create_schema
    Apartment::Database.create(self.schema) unless Storey.schema_exists?(self.schema)
  end

  #Drop Schema before destroy Tenant
  #
  # Author Cuong Pham
  def drop_schema
    Apartment::Database.drop(self.schema) if Storey.schema_exists?(self.schema)
  end

end
