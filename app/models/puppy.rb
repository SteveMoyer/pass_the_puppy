class Puppy <ActiveRecord::Base
 attr_accessible :comments
 belongs_to :owner, :class_name =>"User"
end 
