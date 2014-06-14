module Nganluong
  # Create User with role admin when create Tenant
  #
  # Author Cuong pham
  # Địa chỉ thanh toán hoá đơn của NgânLượng.vn
  NGANLUONG_URL       = 'http://sandbox.nganluong.vn/checkout.php'
  # Mã website của bạn đăng ký trong chức năng tích hợp thanh toán của NgânLượng.vn.
  MERCHANT_SITE_CODE  = '642'
  # Mật khẩu giao tiếp giữa website của bạn và NgânLượng.vn.
  SECURITY_PASS       = '123456789'
  # Mã đối tác tham gia chương trình liên kết của NgânLượng.vn
  AFFILIATE_CODE      = ''

  def self.buildCheckoutUrlExpand(return_url, receiver, transaction_info, order_code, price, currency = 'vnd', quantity = 1, tax = 0, discount = 0, fee_cal = 0, fee_shipping = 0, order_description = '', buyer_info = '', affiliate_code = '')
    require 'digest/md5'

    affiliate_code = Nganluong::AFFILIATE_CODE if affiliate_code.blank?

    arr_params  = {
      'merchant_site_code'  =>  Nganluong::MERCHANT_SITE_CODE,
      'return_url'          =>  return_url.downcase,
      'receiver'            =>  receiver,
      'transaction_info'    =>  transaction_info,
      'order_code'          =>  order_code,
      'price'               =>  price,
      'currency'            =>  currency,
      'quantity'            =>  quantity,
      'tax'                 =>  tax,
      'discount'            =>  discount,
      'fee_cal'             =>  fee_cal,
      'fee_shipping'        =>  fee_shipping,
      'order_description'   =>  order_description,
      'buyer_info'          =>  buyer_info,
      'affiliate_code'      =>  affiliate_code
    }

    secure_code = ''
    secure_code = arr_params.map{|k, v| "#{v}"}.join(' ') + ' ' + Nganluong::SECURITY_PASS

    arr_params['secure_code'] = Digest::MD5.hexdigest(secure_code)

    redirect_url = Nganluong::NGANLUONG_URL

    if redirect_url.index('?').blank?
      redirect_url = redirect_url + '?'
    elsif (redirect_url.last != '?' && redirect_url.index('&').blank?)
      redirect_url = redirect_url + '&'
    end
    redirect_url = redirect_url + arr_params.map{|k,v| "#{k}=#{v}"}.join('&') + ' ' + Nganluong::SECURITY_PASS
  end

  def self.buildCheckoutUrl(return_url, receiver, transaction_info, order_code, price)
    require 'digest/md5'

    arr_params  = {
      'merchant_site_code'  =>  Nganluong::MERCHANT_SITE_CODE,
      'return_url'          =>  return_url.downcase,
      'receiver'            =>  receiver,
      'transaction_info'    =>  transaction_info,
      'order_code'          =>  order_code,
      'price'               =>  price
    }

    secure_code = ''
    secure_code = arr_params.map{|k, v| "#{v}"}.join(' ') + ' ' + Nganluong::SECURITY_PASS

    arr_params['secure_code'] = Digest::MD5.hexdigest(secure_code)
    redirect_url = Nganluong::NGANLUONG_URL

    if redirect_url.index('?').blank?
      redirect_url = redirect_url + '?'
    elsif redirect_url.last != '?' && redirect_url.index('&').blank?
      redirect_url = redirect_url + '&'
    end

    redirect_url = Nganluong::NGANLUONG_URL
    if redirect_url.index('?').blank?
      redirect_url = redirect_url + '?'
    elsif redirect_url.last != '?' && redirect_url.index('&').blank?
      redirect_url = redirect_url + '&'
    end
    redirect_url = redirect_url + arr_params.map{|k,v| "#{k}=#{v}"}.join('&') + '&' + Nganluong::SECURITY_PASS
  end

  def self.verifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code)
    require 'digest/md5'
    str = " #{transaction_info} #{order_code} #{price} #{payment_id} #{payment_type} #{error_text} #{Nganluong::MERCHANT_SITE_CODE} #{Nganluong::SECURITY_PASS}"
    verify_secure_code = ''
    verify_secure_code =  Digest::MD5.hexdigest(str)
    return verify_secure_code == secure_code ? true : false
  end
end