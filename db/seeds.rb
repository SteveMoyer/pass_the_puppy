# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
steveadmin =User.new(:email=>'smoyer@zynx.com', :password=>'zynx10880')
steveadmin.is_admin=true
steveadmin.save
User.create!(:email=>'moyer.steve@gmail.com', :password=>'zynx10880', :is_admin=>false)

