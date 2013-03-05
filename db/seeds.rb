org = Organization.create(:name=>'acme')
admin =User.new(:email=>'admin@test.com', :password=>'adminpass')
admin.is_admin=true
admin.organization=org
admin.save!
user=User.new(:email=>'nonadmin@test.com', :password=>'password')
user.organization= org
fido = Puppy.new(:name=>'fido')
fido.organization= org
fido.save!
adminpup = Puppy.create!(:name=>'adminpup')
adminpup.organization= org
adminpup.owner= admin
adminpup.save!
userpup = Puppy.create!(:name=>'userpup', :owner=>user)
userpup.organization= org
userpup.owner= user
userpup.save!
