class Organization <ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name, :on=> :create
  validates_presence_of :name, :on=>:create
end
