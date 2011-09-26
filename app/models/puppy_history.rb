class PuppyHistory <ActiveRecord::Base
    belongs_to :puppy
    belongs_to :user
    attr_accessible :take_comment, :leave_comment, :taken_time,:left_time,:user
    def useremail
      user.email unless !user
    end 
end
