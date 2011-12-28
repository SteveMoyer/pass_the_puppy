class PuppyHistory <ActiveRecord::Base
    belongs_to :puppy
    belongs_to :user
    attr_accessible :take_comment, :leave_comment, :taken_time,:left_time,:user
    default_scope :order => "taken_time desc"
    def useremail
      user.email unless !user
    end 
end
