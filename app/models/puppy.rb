class Puppy <ActiveRecord::Base
 attr_accessible :comments,:name, :taken_time
 belongs_to :owner, :class_name =>"User"
 validates_uniqueness_of :name, :on=> :create
 has_many :puppy_history
def status
   owner ? owner.email+ ' has the puppy': 'The puppy is available' 
end

end 
