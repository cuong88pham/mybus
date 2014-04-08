# encoding: utf-8

############################################# Truncate Table ########################################################
# Put this in seeds.rb.  This is a full example
# Run with 'rake db:seed', assuming you have already created
# the table.
# Works for mysql, sqlite, sqlite3
def truncate_db_table(table)
  config = ActiveRecord::Base.configurations[Rails.env]
  ActiveRecord::Base.establish_connection
  case config["adapter"]
    when "mysql", "postgresql"
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
    when "sqlite", "sqlite3"
      ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
      ActiveRecord::Base.connection.execute("VACUUM")
  end
end

Tenant.create(domain: "mailinh.mybus.dev", schema:"mailinh")
Tenant.create(domain: "phuongtrang.mybus.dev", schema:"phuongtrang")

schemas = ["mailinh","phuongtrang"]

# Create domain
schemas.each do |schema|
  Apartment::Database.create(schema) unless Storey.schemas.include?(schema)
end

# schemas << "public"

schemas.each do |schema|
  Storey.switch schema do
    user = User.where(username: 'admin').first_or_initialize

    if !user.persisted?
      user.email    = 'admin@mybus.vn'
      user.password = '12344321'
      user.save
    end

  end
end