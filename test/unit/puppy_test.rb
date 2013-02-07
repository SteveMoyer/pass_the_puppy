require 'test_helper'

class PuppyTest <ActiveSupport::TestCase
  test "should not save without name" do
    puppy =Puppy.new
    assert !puppy.save
  end

  test "should save with password" do
    puppy =Puppy.new
    puppy.name ="blah"
    assert puppy.save
  end

  test "should remove owner on leave and add history" do
    puppy = Puppy.new
    user=User.new
    puppy.owner = user
    puppy.leave user, "comment"
    assert puppy.owner==nil
    assert puppy.comments ==nil
    assert puppy.puppy_history.size==1
  end 
end

