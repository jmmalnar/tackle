ActiveRecord::Base.connection.execute("TRUNCATE select_fixed_in_versions") 
["v1.1", "v1.1.1", "v1.1.2", "v1.1.3", "v1.1.4", "v1.1.5", "v1.1.6", "v1.1.7", "v1.1.8", "v1.1.9", "v1.1.10", "v1.1.11"].each do |value|
  SelectFixedInVersion.create!(:value => value)
end

ActiveRecord::Base.connection.execute("TRUNCATE users")
User.create!(:nickname => "dougjohnson", :email => "doug.johnson@sage.com", :is_admin => true)

