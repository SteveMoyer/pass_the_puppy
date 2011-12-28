class Puppy <ActiveRecord::Base
  attr_accessible :comments,:name, :taken_time
  belongs_to :owner, :class_name =>"User"
  validates_uniqueness_of :name, :on=> :create
  has_many :puppy_history
  def status(user=nil)
    if owner
      (owner ==user ? "You have ": owner.email+" has ") + "the puppy."
    else
      'The puppy is available' 
    end
  end
  def is_available?
    owner==nil
  end 
  def can_take_puppy?(user)
    user && is_available?
  end
  def take(user)
    self.owner=user
    self.taken_time=Time.now
  end
  def can_leave_puppy?(user)
    user && owner &&(user==owner ||user.is_admin)
  end
  def leave (user, left_comment)
    if can_leave_puppy? user
      ph=PuppyHistory.new
      ph.update_attributes({:user => owner,:taken_time=>taken_time, :left_time=> Time.now,:take_comment=>comments, :leave_comment=> left_comment})
      self.puppy_history<<ph
      self.owner=nil
      self.comments=nil 
      true
    else
      false
    end
  end
end
