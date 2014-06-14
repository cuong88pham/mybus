ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'ims',
  :password       => '+wf8*Qt/Ya',
  :domain         => 'simpleims.com',
  :enable_starttls_auto => true
}