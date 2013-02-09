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
  
  test "take sets owner and time" do
    puppy = Puppy.new
    user = User.new
    puppy.take user
    assert puppy.owner==user
    assert_not_nil puppy.taken_time
  end 

  test "should remove owner on leave and add history" do
    puppy = Puppy.new
    user=User.new
    puppy.owner = user
    puppy.leave user, "comment"
    assert_nil puppy.owner
    assert_nil  puppy.comments 
    assert puppy.puppy_history.size==1
  end 
  
  test "should include owner email in json" do
    puppy = puppies(:stevesdog)
    json = puppy.as_json()
    puts json
    assert_equal json[:owner]["email"], users(:steve).email
  end 
end

