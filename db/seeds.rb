admin =User.new(:email=>'admin@test.com', :password=>'adminpass')
admin.is_admin=true
admin.save!
user=User.create!(:email=>'nonadmin@test.com', :password=>'password')
fido = Puppy.create!(:name=>'fido')
adminpup = Puppy.create!(:name=>'adminpup')
adminpup.owner= admin
adminpup.save!
userpup = Puppy.create!(:name=>'userpup', :owner=>user)
userpup.owner= user
userpup.save!
