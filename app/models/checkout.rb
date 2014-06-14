class Checkout
  include Nganluong

  def self.build_link_checkout(type='basic', params)
    if type == 'basic'
      Nganluong.buildCheckoutUrl(params['return_url'], params['receiver'], params['transaction_info'], params['order_code'], params['price'])
    else
      Nganluong.buildCheckoutUrlExpand(params)
    end
  end
end