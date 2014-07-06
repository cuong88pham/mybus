module DefaultJob
  extend ActiveSupport::Concern
  # Create User with role admin when create Tenant
  #
  # Author Cuong pham
  def set_admin(params)
    if Storey.schema_exists?(params[:schema])
      Apartment::Database.switch(params[:schema])
      @roles = [{name: 'admin'},
                {name: 'Giám đốc'},
                {name: 'Thư ký'},
                {name: 'Kiểm soát vé'},
                {name: 'Nhân viên bán vé'},
                {name: 'Tài xế'},
                {name: 'Tiếp viên'},
                {name: 'Thủ Kho'},
                {name: 'Kế toán'},
                {name: 'Nhân sự'}]
      Role.create(@roles)
      user = User.create!(
        username: 'admin',
        email: params[:email], password: '12344321'
      )

      # Send Mail to user
      # Do it later
    end
  end
end