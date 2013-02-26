class PuppyHistory <ActiveRecord::Base
    belongs_to :puppy
    belongs_to :user
    attr_accessible :take_comment, :leave_comment, :taken_time,:left_time,:user
    default_scope :limit=> 20,:order => "taken_time desc"
    def user_email
      user.email unless !user
    end 
end
