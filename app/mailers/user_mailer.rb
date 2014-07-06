class UserMailer < ActionMailer::Base
  default from: "noreply@mybus.vn"

  def ticket_info
    @current_tenant = Apartment::Database.current_tenant
    mail(to: 'harry88pham@gmail.com', subject: "Thông tin vé/Ticket information từ #{@current_tenant}.mybus.vn")
  end
end
