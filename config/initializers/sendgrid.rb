ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'cuong88pham',
  :password       => '09120511M@i',
  :domain         => 'mybus.vn',
  :enable_starttls_auto => true
}

# ActionMailer::Base.default_url_options[:host] = "mybus.vn"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?