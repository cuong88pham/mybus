module DefaultJob
  extend ActiveSupport::Concern
  # Create User with role admin when create Tenant
  #
  # Author Cuong pham
  def set_admin(params)
    if Storey.schema_exists?(params[:schema])
      Storey.switch(params[:schema])
      user = User.create!(
        username: 'admin',
        email: params[:email], password: '12344321'
      )
      # Send Mail to user
      # Do it later
    end
  end
end