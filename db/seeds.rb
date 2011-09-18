admin =User.new(:email=>'admin@test.com', :password=>'adminpass')
admin.is_admin=true
admin.save
User.create!(:email=>'nonadmin@test.com', :password=>'pass')

