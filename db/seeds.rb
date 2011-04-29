# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
ActiveRecord::Base.connection.execute("TRUNCATE select_fixed_in_versions") 
["v1.1", "v1.1.1", "v1.1.2", "v1.1.3", "v1.1.4", "v1.1.5", "v1.1.6", "v1.1.7", "v1.1.8", "v1.1.9", "v1.1.10", "v1.1.11"].each do |value|
  SelectFixedInVersion.create!(:value => value)
end

