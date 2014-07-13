class Ticket < ActiveRecord::Base
  extend Enumerize
  belongs_to :bus_trip
  belongs_to :tenant

  validates_presence_of :bus_trip_id, :fullname, :phone, :ticket_sale
  validates_presence_of :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  before_create :set_token_ticket

  STATUS = {
    'pending' => '001',
    'paid'    => '002',
    'unpaid'  => '003'
  }

  SYMBOL_TICKETS_BED = [
    [
      ['A1','','B1','','C1'],
      ['A3','','B3','','C3'],
      ['A5','','B5','','C5'],
      ['A7','P1','B7','P2','C7'],
      ['A9','P3','B7','P4','C9'],
      ['D1','D3','D5','D7','D9']
    ],
    [
      ['A2','','B2','','C2'],
      ['A4','','B4','','C4'],
      ['A6','','B6','','C6'],
      ['A8','','B8','','C8'],
      ['A10','','B10','','C10'],
      ['D2','D4','D6','D8','D10']
    ]
  ]

  enumerize :status, in: STATUS

  private

  def set_token_ticket
    require 'digest/md5'
    token = self.email + self.bus_trip_id.to_s + self.password + self.ticket_sale + rand(9999* Time.zone.now.to_i).to_s
    self.token = Digest::MD5.hexdigest(token)
  end
end
