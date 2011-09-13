class Puppy <ActiveRecord::Base
 attr_accessible :comments,:name
 belongs_to :owner, :class_name =>"User"
def status
   owner ? owner.email+ ' has the puppy': 'The puppy is available' 
end

end 
