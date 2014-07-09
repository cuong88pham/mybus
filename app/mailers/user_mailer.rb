class UserMailer < ActionMailer::Base
  default from: "noreply@mybus.vn"

  def ticket_info(ticket)
    @current_tenant = Apartment::Database.current_tenant
    @ticket = ticket
    mail(to: @ticket.email, subject: "Thông tin vé/Ticket information từ #{@current_tenant}.mybus.vn")
  end

  def ticket_pending(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: "Thông tin vé/Ticket information từ MyBus")
  end
end
