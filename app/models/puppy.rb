class Puppy <ActiveRecord::Base
 attr_accessible :comments,:name, :taken_time
 belongs_to :owner, :class_name =>"User"
 validates_uniqueness_of :name, :on=> :create
 has_many :puppy_history
def status(user)
  if owner
    (owner ==user ? "You have ":owner.email+" has ") + "the puppy."
  else
    'The puppy is available' 
end
def is_available?
  owner==nil
end 
def can_take_puppy?(user)
  user!=nil
end
def can_leave_puppy?(user)
  user && owner &&(user==owner ||user.is_admin)
end
